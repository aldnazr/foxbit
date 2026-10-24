import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_ohlc.freezed.dart';
part 'coin_ohlc.g.dart';

@freezed
abstract class CoinOhlc with _$CoinOhlc {
  const factory CoinOhlc({
    required int timestampMs,
    required double open,
    required double high,
    required double low,
    required double close,
  }) = _CoinOhlc;

  const CoinOhlc._();

  DateTime get timestamp => DateTime.fromMillisecondsSinceEpoch(timestampMs);

  factory CoinOhlc.fromList(List<dynamic> data) {
    return CoinOhlc(
      timestampMs: data[0] as int,
      open: (data[1] as num).toDouble(),
      high: (data[2] as num).toDouble(),
      low: (data[3] as num).toDouble(),
      close: (data[4] as num).toDouble(),
    );
  }

  List<dynamic> toList() {
    return [timestampMs, open, high, low, close];
  }

  factory CoinOhlc.fromJson(Map<String, dynamic> json) =>
      _$CoinOhlcFromJson(json);
}
