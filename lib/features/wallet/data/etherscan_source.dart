import 'dart:async';

import 'package:dio/dio.dart';
import 'package:vault_chain/core/config/env.dart';
import 'package:vault_chain/core/error/app_failure.dart';
import 'package:vault_chain/core/network/dio_error_mapper.dart';
import 'package:vault_chain/features/wallet/domain/wallet_models.dart';

class EtherscanSource {
  final Dio dio;
  EtherscanSource(this.dio);

  String _url(Map<String, String> params) {
    final q = <String, String>{
      'chainid': '1',
      'apikey': Env.etherscanApiKey,
      ...params,
    };
    return '?${q.entries.map((e) => '${e.key}=${Uri.encodeQueryComponent(e.value)}').join('&')}';
  }

  Future<double> fetchBalance(String address) async {
    if (!Env.hasEtherscanKey) {
      throw const AppFailure('API key Etherscan belum dikonfigurasi');
    }
    try {
      final res = await dio.get(
        _url({
          'module': 'account',
          'action': 'balance',
          'address': address,
          'tag': 'latest',
        }),
      );
      return _parseBalance(res.data);
    } catch (e) {
      throw mapDioError(e);
    }
  }

  double _parseBalance(dynamic data) {
    final m = data is Map
        ? Map<String, dynamic>.from(data)
        : <String, dynamic>{};
    final status = m['status']?.toString();
    if (status == '1') {
      final result = m['result']?.toString() ?? '0';
      final wei = BigInt.tryParse(result) ?? BigInt.zero;
      return wei.toDouble() / 1e18;
    }
    final msg = m['message']?.toString() ?? '';
    final result = m['result']?.toString() ?? '';
    throw AppFailure(
      result.isNotEmpty
          ? result
          : msg.isNotEmpty
          ? msg
          : 'Gagal memuat saldo',
    );
  }

  Future<List<WalletTx>> fetchTxs(String address) async {
    if (!Env.hasEtherscanKey) {
      throw const AppFailure('API key Etherscan belum dikonfigurasi');
    }
    int attempts = 0;
    while (true) {
      try {
        final res = await dio.get(
          _url({
            'module': 'account',
            'action': 'txlist',
            'address': address,
            'startblock': '0',
            'endblock': '99999999',
            'page': '1',
            'offset': '20',
            'sort': 'desc',
          }),
        );
        return _parseTxs(res.data, address);
      } catch (e) {
        final af = mapDioError(e);
        final lower = af.message.toLowerCase();
        if (attempts == 0 &&
            (lower.contains('rate limit') || lower.contains('max rate'))) {
          attempts++;
          await Future.delayed(const Duration(seconds: 1));
          continue;
        }
        throw af;
      }
    }
  }

  List<WalletTx> _parseTxs(dynamic data, String address) {
    final m = data is Map
        ? Map<String, dynamic>.from(data)
        : <String, dynamic>{};
    final status = m['status']?.toString();
    if (status == '1') {
      final list = m['result'] is List ? (m['result'] as List) : const [];
      final addrLower = address.toLowerCase();
      final txs = <WalletTx>[];
      for (final raw in list) {
        if (raw is! Map) continue;
        final t = Map<String, dynamic>.from(raw);
        final hash = t['hash']?.toString() ?? '';
        final to = t['to']?.toString().toLowerCase() ?? '';
        final isIn = to == addrLower;
        final valueStr = t['value']?.toString() ?? '0';
        final wei = BigInt.tryParse(valueStr) ?? BigInt.zero;
        final amount = wei.toDouble() / 1e18;
        final tsStr = t['timeStamp']?.toString();
        final ts = tsStr != null ? int.tryParse(tsStr) : null;
        final time = ts != null
            ? DateTime.fromMillisecondsSinceEpoch(ts * 1000)
            : null;
        final isError = t['isError']?.toString() == '1';
        txs.add(
          WalletTx(
            id: hash,
            time: time,
            isIn: isIn,
            amountCoin: amount,
            confirmed: !isError,
          ),
        );
      }
      return txs;
    }
    final msg = m['message']?.toString() ?? '';
    final result = m['result']?.toString() ?? '';
    if (msg.toLowerCase().contains('no transactions')) {
      return [];
    }
    // rate limit retry handled outside? check here too
    final lower = '$result $msg'.toLowerCase();
    if (lower.contains('rate limit') || lower.contains('max rate')) {
      throw AppFailure('Terlalu banyak permintaan, coba lagi sebentar');
    }
    throw AppFailure(
      result.isNotEmpty
          ? result
          : (msg.isNotEmpty ? msg : 'Gagal memuat transaksi'),
    );
  }
}
