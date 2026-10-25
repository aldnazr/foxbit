import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxbit/features/market/application/market_controller.dart';
import 'package:foxbit/features/wallet/domain/wallet_models.dart';
import 'package:foxbit/features/wallet/domain/watched_wallet.dart';
import 'package:foxbit/features/wallet/presentation/providers/wallet_providers.dart';
import 'package:foxbit/shared/models/market_model.dart';
import 'package:foxbit/shared/models/portofolio_model.dart';

part 'portofolio_controller.g.dart';

class PortfolioSummary {
  final double totalValue;
  final double? change24h;
  final List<List<num>> sparklineSeries;

  const PortfolioSummary({
    required this.totalValue,
    this.change24h,
    required this.sparklineSeries,
  });
}

@Riverpod(keepAlive: true)
class PortofolioController extends _$PortofolioController {
  static const String portofolioBox = "portofolioBox";
  static const String boxKey = "portofolioData";

  @override
  Future<List<PortofolioModel>> build() async {
    final box = await Hive.openBox(portofolioBox);
    final stored = box.get(boxKey, defaultValue: []);
    if (stored is List) {
      return stored
          .map((e) => PortofolioModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }

  Future<void> toggleFavorite(PortofolioModel portofolio) async {
    final box = Hive.box(portofolioBox);
    final currentList = state.value ?? [];
    final exists = currentList.any((e) => e.id == portofolio.id);

    final stored = (box.get(boxKey, defaultValue: []) as List).toList();

    if (exists) {
      stored.removeWhere((e) => e["id"] == portofolio.id);
    } else {
      stored.add(portofolio.toJson());
    }

    await box.put(boxKey, stored);

    final updated = stored
        .map((e) => PortofolioModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    state = AsyncData(updated);
  }
}

@riverpod
Future<PortfolioSummary> portfolioSummary(Ref ref) async {
  final watchlist = await ref.watch(portofolioControllerProvider.future);
  final marketState = await ref.watch(marketControllerProvider.future);
  final markets = marketState.markets;
  final wallets = await ref.watch(walletsControllerProvider.future);

  double totalValue = 0;
  double prevValue = 0;
  bool hasPrev = false;
  final series = <List<num>>[];

  for (final coin in markets) {
    final id = coin.id;
    if (id == null || coin.currentPrice == null) continue;
    if (!watchlist.any((e) => e.id == id)) continue;

    final value = coin.currentPrice!.toDouble();
    totalValue += value;

    final change = coin.priceChangePercentage24h;
    if (change != null) {
      final denom = 1 + change / 100;
      if (denom != 0) {
        prevValue += value / denom;
        hasPrev = true;
      }
    }

    final spark = coin.sparklineIn7d?.price;
    if (spark != null) series.add(spark);
  }

  FiatPrices? fiat;
  try {
    fiat = await ref.watch(fiatPricesProvider.future);
  } catch (_) {}

  for (final wallet in wallets) {
    WalletBalance? balance;
    try {
      balance = await ref.watch(walletBalanceProvider(wallet.id).future);
    } catch (_) {
      continue;
    }
    if (balance == null) continue;

    final coinAmount = balance.coinAmount;
    double price;
    String marketId;
    if (wallet.chain == Chain.btc) {
      price = fiat?.btcIdr ?? 0;
      marketId = 'bitcoin';
    } else {
      price = fiat?.ethIdr ?? 0;
      marketId = 'ethereum';
    }

    final value = coinAmount * price;
    totalValue += value;

    MarketModel? marketCoin;
    for (final m in markets) {
      if (m.id == marketId) {
        marketCoin = m;
        break;
      }
    }
    final change = marketCoin?.priceChangePercentage24h;
    if (change != null) {
      final denom = 1 + change / 100;
      if (denom != 0) {
        prevValue += value / denom;
        hasPrev = true;
      }
    }

    final spark = marketCoin?.sparklineIn7d?.price;
    if (spark != null) {
      series.add(spark.map((p) => p * coinAmount).toList());
    }
  }

  final change24h = (hasPrev && prevValue > 0)
      ? ((totalValue - prevValue) / prevValue) * 100
      : null;

  return PortfolioSummary(
    totalValue: totalValue,
    change24h: change24h,
    sparklineSeries: series,
  );
}

@riverpod
bool isFavorite(Ref ref, String id) {
  final portofolioList = ref.watch(
    portofolioControllerProvider.select((async) => async.value ?? []),
  );
  return portofolioList.any((e) => e.id == id);
}
