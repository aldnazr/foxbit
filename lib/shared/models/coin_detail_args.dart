import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_detail_args.freezed.dart';

@freezed
abstract class CoinDetailArgs with _$CoinDetailArgs {
  const factory CoinDetailArgs({
    required String id,
    String? name,
    String? symbol,
    String? image,
    int? marketCapRank,
  }) = _CoinDetailArgs;
}
