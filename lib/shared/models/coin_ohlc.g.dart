// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_ohlc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinOhlc _$CoinOhlcFromJson(Map<String, dynamic> json) => _CoinOhlc(
  timestampMs: (json['timestampMs'] as num).toInt(),
  open: (json['open'] as num).toDouble(),
  high: (json['high'] as num).toDouble(),
  low: (json['low'] as num).toDouble(),
  close: (json['close'] as num).toDouble(),
);

Map<String, dynamic> _$CoinOhlcToJson(_CoinOhlc instance) => <String, dynamic>{
  'timestampMs': instance.timestampMs,
  'open': instance.open,
  'high': instance.high,
  'low': instance.low,
  'close': instance.close,
};
