import 'package:foxbit/data/api/coin_gecko_api.dart';
import 'package:foxbit/data/api/endpoint.dart';
import 'package:foxbit/features/coin_detail/state/coin_detail_state.dart';
import 'package:foxbit/shared/models/coin_detail.dart';
import 'package:foxbit/shared/models/coin_ohlc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coin_detail_controller.g.dart';

const _rangeDays = {'1D': 1, '1W': 7, '1M': 30, '1Y': 365, 'All': 'max'};

@riverpod
class CoinDetailController extends _$CoinDetailController {
  final _api = CoinGeckoApi();

  @override
  Future<CoinDetailState> build(String id) async {
    final detailFuture = _api.getDetails(Endpoint.details(id));
    final ohlcFuture = _api.getOhlc(Endpoint.ohlc(id, days: _rangeDays['1D']));

    final results = await Future.wait([detailFuture, ohlcFuture]);

    return CoinDetailState(
      detail: results[0] as CoinDetail,
      ohlc: results[1] as List<CoinOhlc>,
    );
  }

  Future<void> setRange(String range) async {
    final current = state.value;
    if (current == null || current.detail == null || range == current.range) {
      return;
    }

    state = AsyncData(current.copyWith(range: range, isRangeLoading: true));

    try {
      final ohlc = await _api.getOhlc(
        Endpoint.ohlc(id, days: _rangeDays[range]),
      );
      state = AsyncData(
        state.value!.copyWith(ohlc: ohlc, isRangeLoading: false),
      );
    } catch (_) {
      state = AsyncData(state.value!.copyWith(isRangeLoading: false));
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final detailFuture = _api.getDetails(Endpoint.details(id));
      final ohlcFuture = _api.getOhlc(
        Endpoint.ohlc(id, days: _rangeDays['1D']),
      );

      final results = await Future.wait([detailFuture, ohlcFuture]);

      return CoinDetailState(
        detail: results[0] as CoinDetail,
        ohlc: results[1] as List<CoinOhlc>,
      );
    });
  }
}
