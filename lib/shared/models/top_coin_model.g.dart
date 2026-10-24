// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopCoinModel _$TopCoinModelFromJson(Map<String, dynamic> json) =>
    _TopCoinModel(
      coins: (json['coins'] as List<dynamic>)
          .map((e) => Coin.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopCoinModelToJson(_TopCoinModel instance) =>
    <String, dynamic>{'coins': instance.coins};

_Coin _$CoinFromJson(Map<String, dynamic> json) =>
    _Coin(item: TopCoinItem.fromJson(json['item'] as Map<String, dynamic>));

Map<String, dynamic> _$CoinToJson(_Coin instance) => <String, dynamic>{
  'item': instance.item,
};

_TopCoinItem _$TopCoinItemFromJson(Map<String, dynamic> json) => _TopCoinItem(
  id: json['id'] as String,
  coinId: (json['coin_id'] as num).toInt(),
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  marketCapRank: (json['market_cap_rank'] as num).toInt(),
  thumb: json['thumb'] as String,
  small: json['small'] as String,
  large: json['large'] as String,
  slug: json['slug'] as String,
  priceBtc: (json['price_btc'] as num).toDouble(),
  score: (json['score'] as num).toInt(),
  data: Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TopCoinItemToJson(_TopCoinItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coin_id': instance.coinId,
      'name': instance.name,
      'symbol': instance.symbol,
      'market_cap_rank': instance.marketCapRank,
      'thumb': instance.thumb,
      'small': instance.small,
      'large': instance.large,
      'slug': instance.slug,
      'price_btc': instance.priceBtc,
      'score': instance.score,
      'data': instance.data,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
  price: (json['price'] as num).toDouble(),
  priceBtc: json['price_btc'] as String,
  priceChangePercentage24h:
      (json['price_change_percentage_24h'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
  marketCap: json['market_cap'] as String,
  marketCapBtc: json['market_cap_btc'] as String,
  totalVolume: json['total_volume'] as String,
  totalVolumeBtc: json['total_volume_btc'] as String,
  sparkline: json['sparkline'] as String,
);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'price': instance.price,
  'price_btc': instance.priceBtc,
  'price_change_percentage_24h': instance.priceChangePercentage24h,
  'market_cap': instance.marketCap,
  'market_cap_btc': instance.marketCapBtc,
  'total_volume': instance.totalVolume,
  'total_volume_btc': instance.totalVolumeBtc,
  'sparkline': instance.sparkline,
};
