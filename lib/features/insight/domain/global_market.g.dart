// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GlobalMarket _$GlobalMarketFromJson(Map<String, dynamic> json) =>
    _GlobalMarket(
      totalMarketCapUsd: _totalMarketCapUsdFromData(json['data']),
      totalVolumeUsd: _totalVolumeUsdFromData(json['data']),
      btcDominance: _btcDominanceFromData(json['data']),
      ethDominance: _ethDominanceFromData(json['data']),
      marketCapChange24h: _marketCapChange24hFromData(json['data']),
    );

Map<String, dynamic> _$GlobalMarketToJson(_GlobalMarket instance) =>
    <String, dynamic>{};
