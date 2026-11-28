import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_coin_model.freezed.dart';
part 'search_coin_model.g.dart';

@freezed
abstract class SearchCoinModel with _$SearchCoinModel {
  const factory SearchCoinModel({required List<SearchCoin> coins}) =
      _SearchCoinModel;

  factory SearchCoinModel.fromJson(Map<String, dynamic> json) =>
      _$SearchCoinModelFromJson(json);
}

@freezed
abstract class SearchCoin with _$SearchCoin {
  const factory SearchCoin({
    required String id,
    required String name,
    required String symbol,
    @JsonKey(name: 'market_cap_rank') int? marketCapRank,
    String? thumb,
    String? large,
  }) = _SearchCoin;

  factory SearchCoin.fromJson(Map<String, dynamic> json) =>
      _$SearchCoinFromJson(json);
}
