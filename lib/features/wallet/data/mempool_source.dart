import 'package:dio/dio.dart';
import 'package:foxbit/core/network/dio_error_mapper.dart';
import 'package:foxbit/features/wallet/domain/wallet_models.dart';

class MempoolSource {
  final Dio dio;
  MempoolSource(this.dio);

  Future<double> fetchBalance(String address) async {
    try {
      final res = await dio.get('/address/$address');
      final data = res.data is Map
          ? Map<String, dynamic>.from(res.data as Map)
          : <String, dynamic>{};
      final chain = data['chain_stats'] is Map
          ? Map<String, dynamic>.from(data['chain_stats'])
          : <String, dynamic>{};
      final mempool = data['mempool_stats'] is Map
          ? Map<String, dynamic>.from(data['mempool_stats'])
          : <String, dynamic>{};
      int read(Map m, String k) {
        final v = m[k];
        if (v is num) return v.toInt();
        if (v is String) return int.tryParse(v) ?? 0;
        return 0;
      }

      final fundedChain = read(chain, 'funded_txo_sum');
      final spentChain = read(chain, 'spent_txo_sum');
      final fundedMempool = read(mempool, 'funded_txo_sum');
      final spentMempool = read(mempool, 'spent_txo_sum');
      final sats = (fundedChain - spentChain) + (fundedMempool - spentMempool);
      return sats / 1e8;
    } catch (e) {
      throw mapDioError(e);
    }
  }

  Future<List<WalletTx>> fetchTxs(String address) async {
    try {
      final res = await dio.get('/address/$address/txs');
      final list = res.data is List ? (res.data as List) : <dynamic>[];
      final txs = <WalletTx>[];
      for (final raw in list.take(20)) {
        if (raw is! Map) continue;
        final tx = Map<String, dynamic>.from(raw);
        final txid = tx['txid']?.toString() ?? '';
        final status = tx['status'] is Map
            ? Map<String, dynamic>.from(tx['status'])
            : <String, dynamic>{};
        final confirmed = status['confirmed'] == true;
        final blockTime = status['block_time'];
        DateTime? time;
        if (blockTime is num) {
          time = DateTime.fromMillisecondsSinceEpoch(blockTime.toInt() * 1000);
        } else if (blockTime is String) {
          final n = int.tryParse(blockTime);
          if (n != null) time = DateTime.fromMillisecondsSinceEpoch(n * 1000);
        }
        final vout = tx['vout'] is List ? tx['vout'] as List : const [];
        final vin = tx['vin'] is List ? tx['vin'] as List : const [];
        int received = 0;
        int spent = 0;
        for (final o in vout) {
          if (o is Map && o['scriptpubkey_address']?.toString() == address) {
            final v = o['value'];
            if (v is num) received += v.toInt();
            if (v is String) received += int.tryParse(v) ?? 0;
          }
        }
        for (final i in vin) {
          if (i is Map) {
            final prev = i['prevout'];
            if (prev is Map &&
                prev['scriptpubkey_address']?.toString() == address) {
              final v = prev['value'];
              if (v is num) spent += v.toInt();
              if (v is String) spent += int.tryParse(v) ?? 0;
            }
          }
        }
        final net = received - spent;
        txs.add(
          WalletTx(
            id: txid,
            time: time,
            isIn: net >= 0,
            amountCoin: net.abs() / 1e8,
            confirmed: confirmed,
          ),
        );
      }
      return txs;
    } catch (e) {
      throw mapDioError(e);
    }
  }
}
