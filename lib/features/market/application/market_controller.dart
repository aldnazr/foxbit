import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vault_chain/data/api/coin_gecko_api.dart';
import 'package:vault_chain/data/api/endpoint.dart';
import 'package:vault_chain/shared/models/market_model.dart';
import 'package:vault_chain/shared/models/top_coin_model.dart';

part 'market_controller.g.dart';

class MarketState({
  required final List<MarketModel> markets,
  required final int currentPage,
  required final bool isLoadingMore,
}) {
  MarketState copyWith({
    List<MarketModel>? markets,
    int? currentPage,
    bool? isLoadingMore,
  }) {
    return MarketState(
      markets: markets ?? this.markets,
      currentPage: currentPage ?? this.currentPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@Riverpod(keepAlive: true)
class MarketController extends _$MarketController {
  final _api = CoinGeckoApi();

  @override
  Future<MarketState> build() async {
    final markets = await _api.getMarkets(
      Endpoint.markets(page: 1, perPage: 20),
    );
    return MarketState(markets: markets, currentPage: 1, isLoadingMore: false);
  }

  Future<void> fetchNextPage() async {
    final currentState = state.value;
    if (currentState == null || currentState.isLoadingMore) return;

    state = AsyncData(currentState.copyWith(isLoadingMore: true));

    try {
      final nextPage = currentState.currentPage + 1;
      final newMarkets = await _api.getMarkets(
        Endpoint.markets(page: nextPage, perPage: 20),
      );

      state = AsyncData(
        currentState.copyWith(
          markets: [...currentState.markets, ...newMarkets],
          currentPage: nextPage,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      state = AsyncData(currentState.copyWith(isLoadingMore: false));
      // Re-throw if initial page failed, but for pagination preserve existing list
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final markets = await _api.getMarkets(
        Endpoint.markets(page: 1, perPage: 20),
      );
      return MarketState(
        markets: markets,
        currentPage: 1,
        isLoadingMore: false,
      );
    });
  }
}

@Riverpod(keepAlive: true)
class MarketFilter extends _$MarketFilter {
  @override
  String build() => "Kripto";

  void setFilter(String filter) {
    state = filter;
  }
}

@Riverpod(keepAlive: true)
class TopCoinsController extends _$TopCoinsController {
  final _api = CoinGeckoApi();

  @override
  Future<TopCoinModel> build() async {
    return _api.getTrendings(Endpoint.trending());
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _api.getTrendings(Endpoint.trending()),
    );
  }
}
