// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrendingCoin _$TrendingCoinFromJson(Map<String, dynamic> json) =>
    _TrendingCoin(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      marketCapRank: _nullableIntFromJson(json['market_cap_rank']),
      small: json['small'] as String?,
      thumb: json['thumb'] as String?,
      priceChange24h: _priceChangeFromData(json['data']),
    );

Map<String, dynamic> _$TrendingCoinToJson(_TrendingCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
    };
