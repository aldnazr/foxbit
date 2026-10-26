import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_market.freezed.dart';
part 'global_market.g.dart';

@freezed
abstract class GlobalMarket with _$GlobalMarket {
  const factory GlobalMarket({
    @JsonKey(name: 'data', fromJson: _totalMarketCapUsdFromData, includeToJson: false)
    required double totalMarketCapUsd,
    @JsonKey(name: 'data', fromJson: _totalVolumeUsdFromData, includeToJson: false)
    required double totalVolumeUsd,
    @JsonKey(name: 'data', fromJson: _btcDominanceFromData, includeToJson: false)
    required double btcDominance,
    @JsonKey(name: 'data', fromJson: _ethDominanceFromData, includeToJson: false)
    required double ethDominance,
    @JsonKey(name: 'data', fromJson: _marketCapChange24hFromData, includeToJson: false)
    required double marketCapChange24h,
  }) = _GlobalMarket;

  factory GlobalMarket.fromJson(Map<String, dynamic> json) =>
      _$GlobalMarketFromJson(json);
}

double _readNum(dynamic v) {
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v) ?? 0;
  return 0;
}

double _readMap(dynamic map, String key) {
  if (map is Map) {
    return _readNum(map[key]);
  }
  return 0;
}

double _totalMarketCapUsdFromData(dynamic data) {
  final m = data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};
  return _readMap(m['total_market_cap'], 'usd');
}

double _totalVolumeUsdFromData(dynamic data) {
  final m = data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};
  return _readMap(m['total_volume'], 'usd');
}

double _btcDominanceFromData(dynamic data) {
  final m = data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};
  return _readMap(m['market_cap_percentage'], 'btc');
}

double _ethDominanceFromData(dynamic data) {
  final m = data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};
  return _readMap(m['market_cap_percentage'], 'eth');
}

double _marketCapChange24hFromData(dynamic data) {
  final m = data is Map ? Map<String, dynamic>.from(data) : <String, dynamic>{};
  return _readNum(m['market_cap_change_percentage_24h_usd']);
}
