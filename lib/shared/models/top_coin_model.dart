// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_coin_model.freezed.dart';
part 'top_coin_model.g.dart';

@freezed
abstract class TopCoinModel with _$TopCoinModel {
  const factory TopCoinModel({required List<Coin> coins}) = _TopCoinModel;

  factory TopCoinModel.fromJson(Map<String, dynamic> json) =>
      _$TopCoinModelFromJson(json);
}

@freezed
abstract class Coin with _$Coin {
  const factory Coin({required TopCoinItem item}) = _Coin;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
}

@freezed
abstract class TopCoinItem with _$TopCoinItem {
  const factory TopCoinItem({
    required String id,
    @JsonKey(name: 'coin_id') required int coinId,
    required String name,
    required String symbol,
    @JsonKey(name: 'market_cap_rank') required int marketCapRank,
    required String thumb,
    required String small,
    required String large,
    required String slug,
    @JsonKey(name: 'price_btc') required double priceBtc,
    required int score,
    required Data data,
  }) = _TopCoinItem;

  factory TopCoinItem.fromJson(Map<String, dynamic> json) =>
      _$TopCoinItemFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    required double price,
    @JsonKey(name: 'price_btc') required String priceBtc,
    @JsonKey(name: 'price_change_percentage_24h')
    required Map<String, double> priceChangePercentage24h,
    @JsonKey(name: 'market_cap') required String marketCap,
    @JsonKey(name: 'market_cap_btc') required String marketCapBtc,
    @JsonKey(name: 'total_volume') required String totalVolume,
    @JsonKey(name: 'total_volume_btc') required String totalVolumeBtc,
    required String sparkline,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
