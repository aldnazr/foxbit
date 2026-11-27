import 'package:foxbit/shared/models/chart_point.dart';
import 'package:foxbit/shared/models/coin_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_detail_state.freezed.dart';

@freezed
abstract class CoinDetailState with _$CoinDetailState {
  const factory CoinDetailState({
    CoinDetail? detail,
    List<ChartPoint>? chartPoints,
    @Default('1D') String range,
    @Default(false) bool isRangeLoading,
  }) = _CoinDetailState;
}
