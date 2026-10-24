import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_detail.freezed.dart';
part 'coin_detail.g.dart';

@freezed
abstract class CoinDetail with _$CoinDetail {
  const factory CoinDetail({
    required String id,
    required String symbol,
    required String name,
    @JsonKey(name: 'hashing_algorithm') String? hashingAlgorithm,
    List<String>? categories,
    required CoinImage image,
    @JsonKey(name: 'market_data') required MarketData marketData,
  }) = _CoinDetail;

  factory CoinDetail.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailFromJson(json);
}

@freezed
abstract class CoinImage with _$CoinImage {
  const factory CoinImage({
    required String thumb,
    required String small,
    required String large,
  }) = _CoinImage;

  factory CoinImage.fromJson(Map<String, dynamic> json) =>
      _$CoinImageFromJson(json);
}

@freezed
abstract class MarketData with _$MarketData {
  const factory MarketData({
    @JsonKey(name: 'current_price') required Map<String, num?> currentPrice,
    @JsonKey(name: 'market_cap_rank') num? marketCapRank,
    @JsonKey(name: 'price_change_percentage_24h') double? priceChange24h,
    @JsonKey(name: 'price_change_percentage_7d') double? priceChange7d,
    @JsonKey(name: 'price_change_percentage_14d') double? priceChange14d,
    @JsonKey(name: 'price_change_percentage_30d') double? priceChange30d,
    @JsonKey(name: 'price_change_percentage_60d') double? priceChange60d,
    @JsonKey(name: 'price_change_percentage_1y') double? priceChange1y,
  }) = _MarketData;

  const MarketData._();

  Map<String, double?> get changes => {
    '24h': priceChange24h,
    '7d': priceChange7d,
    '14d': priceChange14d,
    '30d': priceChange30d,
    '60d': priceChange60d,
    '1y': priceChange1y,
  };

  factory MarketData.fromJson(Map<String, dynamic> json) =>
      _$MarketDataFromJson(json);
}

@freezed
abstract class Market with _$Market {
  const factory Market({
    required String name,
    required String identifier,
    @JsonKey(name: 'has_trading_incentive') required bool hasTradingIncentive,
  }) = _Market;

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
}
