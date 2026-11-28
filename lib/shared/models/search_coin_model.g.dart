// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchCoinModel _$SearchCoinModelFromJson(Map<String, dynamic> json) =>
    _SearchCoinModel(
      coins: (json['coins'] as List<dynamic>)
          .map((e) => SearchCoin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchCoinModelToJson(_SearchCoinModel instance) =>
    <String, dynamic>{'coins': instance.coins};

_SearchCoin _$SearchCoinFromJson(Map<String, dynamic> json) => _SearchCoin(
  id: json['id'] as String,
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  marketCapRank: (json['market_cap_rank'] as num?)?.toInt(),
  thumb: json['thumb'] as String?,
  large: json['large'] as String?,
);

Map<String, dynamic> _$SearchCoinToJson(_SearchCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'market_cap_rank': instance.marketCapRank,
      'thumb': instance.thumb,
      'large': instance.large,
    };
