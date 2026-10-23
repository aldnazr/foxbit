import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_model.freezed.dart';
part 'market_model.g.dart';

@freezed
abstract class MarketModel with _$MarketModel {
  const factory MarketModel({
    String? id,
    String? symbol,
    String? name,
    String? image,
    @JsonKey(name: 'current_price') num? currentPrice,
    @JsonKey(name: 'market_cap_rank') num? marketCapRank,
    @JsonKey(name: 'price_change_percentage_24h') num? priceChangePercentage24h,
    @JsonKey(name: 'sparkline_in_7d') SparklineIn7d? sparklineIn7d,
  }) = _MarketModel;

  factory MarketModel.fromJson(Map<String, dynamic> json) =>
      _$MarketModelFromJson(json);
}

@freezed
abstract class SparklineIn7d with _$SparklineIn7d {
  const factory SparklineIn7d({required List<num> price}) = _SparklineIn7d;

  factory SparklineIn7d.fromJson(Map<String, dynamic> json) =>
      _$SparklineIn7dFromJson(json);
}
