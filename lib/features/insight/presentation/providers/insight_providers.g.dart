// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(insightRemoteSource)
final insightRemoteSourceProvider = InsightRemoteSourceProvider._();

final class InsightRemoteSourceProvider
    extends
        $FunctionalProvider<
          InsightRemoteSource,
          InsightRemoteSource,
          InsightRemoteSource
        >
    with $Provider<InsightRemoteSource> {
  InsightRemoteSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insightRemoteSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insightRemoteSourceHash();

  @$internal
  @override
  $ProviderElement<InsightRemoteSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InsightRemoteSource create(Ref ref) {
    return insightRemoteSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InsightRemoteSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InsightRemoteSource>(value),
    );
  }
}

String _$insightRemoteSourceHash() =>
    r'ebee5ef70293d93477db5a4dba962dbc7472db1f';

@ProviderFor(fearGreed)
final fearGreedProvider = FearGreedProvider._();

final class FearGreedProvider
    extends
        $FunctionalProvider<
          AsyncValue<FearGreed>,
          FearGreed,
          FutureOr<FearGreed>
        >
    with $FutureModifier<FearGreed>, $FutureProvider<FearGreed> {
  FearGreedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fearGreedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fearGreedHash();

  @$internal
  @override
  $FutureProviderElement<FearGreed> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<FearGreed> create(Ref ref) {
    return fearGreed(ref);
  }
}

String _$fearGreedHash() => r'7d21d98f1344f284de7609ac06eda7c9f1021257';

@ProviderFor(globalMarket)
final globalMarketProvider = GlobalMarketProvider._();

final class GlobalMarketProvider
    extends
        $FunctionalProvider<
          AsyncValue<GlobalMarket>,
          GlobalMarket,
          FutureOr<GlobalMarket>
        >
    with $FutureModifier<GlobalMarket>, $FutureProvider<GlobalMarket> {
  GlobalMarketProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalMarketProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalMarketHash();

  @$internal
  @override
  $FutureProviderElement<GlobalMarket> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GlobalMarket> create(Ref ref) {
    return globalMarket(ref);
  }
}

String _$globalMarketHash() => r'3f275ed373fa66de808f5bc4bc4787009ba82c56';

@ProviderFor(trendingCoins)
final trendingCoinsProvider = TrendingCoinsProvider._();

final class TrendingCoinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TrendingCoin>>,
          List<TrendingCoin>,
          FutureOr<List<TrendingCoin>>
        >
    with
        $FutureModifier<List<TrendingCoin>>,
        $FutureProvider<List<TrendingCoin>> {
  TrendingCoinsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'trendingCoinsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$trendingCoinsHash();

  @$internal
  @override
  $FutureProviderElement<List<TrendingCoin>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TrendingCoin>> create(Ref ref) {
    return trendingCoins(ref);
  }
}

String _$trendingCoinsHash() => r'b6067c16303a81fadf69533c17f8dcb6af1dc251';

@ProviderFor(cryptoNews)
final cryptoNewsProvider = CryptoNewsProvider._();

final class CryptoNewsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<NewsItem>>,
          List<NewsItem>,
          FutureOr<List<NewsItem>>
        >
    with $FutureModifier<List<NewsItem>>, $FutureProvider<List<NewsItem>> {
  CryptoNewsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cryptoNewsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cryptoNewsHash();

  @$internal
  @override
  $FutureProviderElement<List<NewsItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<NewsItem>> create(Ref ref) {
    return cryptoNews(ref);
  }
}

String _$cryptoNewsHash() => r'bc4f49c85c6959a7056a2f0ddb32a380b43dd55c';
