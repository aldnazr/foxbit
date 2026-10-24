// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketModel _$MarketModelFromJson(Map<String, dynamic> json) => _MarketModel(
  id: json['id'] as String?,
  symbol: json['symbol'] as String?,
  name: json['name'] as String?,
  image: json['image'] as String?,
  currentPrice: json['current_price'] as num?,
  marketCapRank: json['market_cap_rank'] as num?,
  priceChangePercentage24h: json['price_change_percentage_24h'] as num?,
  sparklineIn7d: json['sparkline_in_7d'] == null
      ? null
      : SparklineIn7d.fromJson(json['sparkline_in_7d'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MarketModelToJson(_MarketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'market_cap_rank': instance.marketCapRank,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'sparkline_in_7d': instance.sparklineIn7d,
    };

_SparklineIn7d _$SparklineIn7dFromJson(Map<String, dynamic> json) =>
    _SparklineIn7d(
      price: (json['price'] as List<dynamic>).map((e) => e as num).toList(),
    );

Map<String, dynamic> _$SparklineIn7dToJson(_SparklineIn7d instance) =>
    <String, dynamic>{'price': instance.price};
