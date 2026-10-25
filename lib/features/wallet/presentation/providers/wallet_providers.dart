import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:foxbit/core/network/dio_providers.dart';
import 'package:foxbit/features/wallet/data/etherscan_source.dart';
import 'package:foxbit/features/wallet/data/mempool_source.dart';
import 'package:foxbit/features/wallet/data/wallet_repository.dart';
import 'package:foxbit/features/wallet/domain/wallet_models.dart';
import 'package:foxbit/features/wallet/domain/watched_wallet.dart';

part 'wallet_providers.g.dart';

@Riverpod(keepAlive: true)
class WalletsController extends _$WalletsController {
  final _repo = WalletRepository();

  @override
  Future<List<WatchedWallet>> build() async {
    return _repo.load();
  }

  Future<void> add(WatchedWallet wallet) async {
    final current = state.value ?? [];
    final exists = current.any(
      (w) =>
          w.chain == wallet.chain &&
          w.address.toLowerCase() == wallet.address.toLowerCase(),
    );
    if (exists) {
      throw StateError('duplicate');
    }
    final updated = [...current, wallet];
    await _repo.save(updated);
    state = AsyncData(updated);
  }

  Future<void> remove(String id) async {
    final current = state.value ?? [];
    final updated = current.where((w) => w.id != id).toList();
    await _repo.save(updated);
    state = AsyncData(updated);
  }
}

@Riverpod(keepAlive: true)
MempoolSource mempoolSource(Ref ref) =>
    MempoolSource(ref.watch(mempoolDioProvider));

@Riverpod(keepAlive: true)
EtherscanSource etherscanSource(Ref ref) =>
    EtherscanSource(ref.watch(etherscanDioProvider));

@riverpod
Future<WalletBalance> walletBalance(Ref ref, String walletId) async {
  final wallets = await ref.watch(walletsControllerProvider.future);
  final wallet = wallets.firstWhere((w) => w.id == walletId);
  if (wallet.chain == Chain.btc) {
    final src = ref.read(mempoolSourceProvider);
    final amount = await src.fetchBalance(wallet.address);
    return WalletBalance(coinAmount: amount);
  } else {
    final src = ref.read(etherscanSourceProvider);
    final amount = await src.fetchBalance(wallet.address);
    return WalletBalance(coinAmount: amount);
  }
}

@riverpod
Future<List<WalletTx>> walletTxs(Ref ref, String walletId) async {
  final wallets = await ref.watch(walletsControllerProvider.future);
  final wallet = wallets.firstWhere((w) => w.id == walletId);
  if (wallet.chain == Chain.btc) {
    final src = ref.read(mempoolSourceProvider);
    return src.fetchTxs(wallet.address);
  } else {
    final src = ref.read(etherscanSourceProvider);
    return src.fetchTxs(wallet.address);
  }
}

@Riverpod(keepAlive: true)
Future<FiatPrices> fiatPrices(Ref ref) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 2), link.close);
  ref.onDispose(timer.cancel);
  final dio = ref.watch(coingeckoDioProvider);
  final res = await dio.get(
    '/simple/price',
    queryParameters: {'ids': 'bitcoin,ethereum', 'vs_currencies': 'usd,idr'},
  );
  final data = res.data is Map
      ? Map<String, dynamic>.from(res.data as Map)
      : <String, dynamic>{};
  double read(String coin, String cur) {
    final c = data[coin];
    if (c is Map) {
      final v = c[cur];
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0;
    }
    return 0;
  }

  return FiatPrices(
    btcUsd: read('bitcoin', 'usd'),
    btcIdr: read('bitcoin', 'idr'),
    ethUsd: read('ethereum', 'usd'),
    ethIdr: read('ethereum', 'idr'),
  );
}
