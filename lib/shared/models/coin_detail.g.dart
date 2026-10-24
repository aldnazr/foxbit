// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinDetail _$CoinDetailFromJson(Map<String, dynamic> json) => _CoinDetail(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  hashingAlgorithm: json['hashing_algorithm'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  image: CoinImage.fromJson(json['image'] as Map<String, dynamic>),
  marketData: MarketData.fromJson(json['market_data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CoinDetailToJson(_CoinDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'hashing_algorithm': instance.hashingAlgorithm,
      'categories': instance.categories,
      'image': instance.image,
      'market_data': instance.marketData,
    };

_CoinImage _$CoinImageFromJson(Map<String, dynamic> json) => _CoinImage(
  thumb: json['thumb'] as String,
  small: json['small'] as String,
  large: json['large'] as String,
);

Map<String, dynamic> _$CoinImageToJson(_CoinImage instance) =>
    <String, dynamic>{
      'thumb': instance.thumb,
      'small': instance.small,
      'large': instance.large,
    };

_MarketData _$MarketDataFromJson(Map<String, dynamic> json) => _MarketData(
  currentPrice: Map<String, num?>.from(json['current_price'] as Map),
  marketCapRank: json['market_cap_rank'] as num?,
  priceChange24h: (json['price_change_percentage_24h'] as num?)?.toDouble(),
  priceChange7d: (json['price_change_percentage_7d'] as num?)?.toDouble(),
  priceChange14d: (json['price_change_percentage_14d'] as num?)?.toDouble(),
  priceChange30d: (json['price_change_percentage_30d'] as num?)?.toDouble(),
  priceChange60d: (json['price_change_percentage_60d'] as num?)?.toDouble(),
  priceChange1y: (json['price_change_percentage_1y'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MarketDataToJson(_MarketData instance) =>
    <String, dynamic>{
      'current_price': instance.currentPrice,
      'market_cap_rank': instance.marketCapRank,
      'price_change_percentage_24h': instance.priceChange24h,
      'price_change_percentage_7d': instance.priceChange7d,
      'price_change_percentage_14d': instance.priceChange14d,
      'price_change_percentage_30d': instance.priceChange30d,
      'price_change_percentage_60d': instance.priceChange60d,
      'price_change_percentage_1y': instance.priceChange1y,
    };

_Market _$MarketFromJson(Map<String, dynamic> json) => _Market(
  name: json['name'] as String,
  identifier: json['identifier'] as String,
  hasTradingIncentive: json['has_trading_incentive'] as bool,
);

Map<String, dynamic> _$MarketToJson(_Market instance) => <String, dynamic>{
  'name': instance.name,
  'identifier': instance.identifier,
  'has_trading_incentive': instance.hasTradingIncentive,
};
