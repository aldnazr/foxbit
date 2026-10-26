import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_coin.freezed.dart';
part 'trending_coin.g.dart';

@freezed
abstract class TrendingCoin with _$TrendingCoin {
  const factory TrendingCoin({
    @JsonKey(defaultValue: '') required String id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String symbol,
    @JsonKey(name: 'market_cap_rank', fromJson: _nullableIntFromJson, includeToJson: false)
    int? marketCapRank,
    @JsonKey(name: 'small', includeToJson: false) String? small,
    @JsonKey(name: 'thumb', includeToJson: false) String? thumb,
    @JsonKey(name: 'data', fromJson: _priceChangeFromData, includeToJson: false)
    double? priceChange24h,
  }) = _TrendingCoin;

  const TrendingCoin._();

  String? get thumbUrl => small ?? thumb;

  factory TrendingCoin.fromJson(Map<String, dynamic> json) =>
      _$TrendingCoinFromJson(json);
}

int? _nullableIntFromJson(dynamic v) {
  if (v is num) return v.toInt();
  return int.tryParse(v?.toString() ?? '');
}

double? _priceChangeFromData(dynamic data) {
  if (data is! Map) return null;
  final m = Map<String, dynamic>.from(data);
  final pcp = m['price_change_percentage_24h'];
  if (pcp is Map) {
    final usd = pcp['usd'];
    if (usd is num) return usd.toDouble();
    if (usd is String) return double.tryParse(usd);
  } else if (pcp is num) {
    return pcp.toDouble();
  }
  return null;
}
