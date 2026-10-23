// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MarketController)
final marketControllerProvider = MarketControllerProvider._();

final class MarketControllerProvider
    extends $AsyncNotifierProvider<MarketController, MarketState> {
  MarketControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'marketControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$marketControllerHash();

  @$internal
  @override
  MarketController create() => MarketController();
}

String _$marketControllerHash() => r'ce0b8583f88425731fc5059c44ee24ae14694805';

abstract class _$MarketController extends $AsyncNotifier<MarketState> {
  FutureOr<MarketState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<MarketState>, MarketState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MarketState>, MarketState>,
              AsyncValue<MarketState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(MarketFilter)
final marketFilterProvider = MarketFilterProvider._();

final class MarketFilterProvider
    extends $NotifierProvider<MarketFilter, String> {
  MarketFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'marketFilterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$marketFilterHash();

  @$internal
  @override
  MarketFilter create() => MarketFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$marketFilterHash() => r'3e2fb85235e6ec0126b856bd0cef3220a60cf223';

abstract class _$MarketFilter extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(TopCoinsController)
final topCoinsControllerProvider = TopCoinsControllerProvider._();

final class TopCoinsControllerProvider
    extends $AsyncNotifierProvider<TopCoinsController, TopCoinModel> {
  TopCoinsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topCoinsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topCoinsControllerHash();

  @$internal
  @override
  TopCoinsController create() => TopCoinsController();
}

String _$topCoinsControllerHash() =>
    r'ea452d7d64251e298a2628a454a7a39c4ab0e653';

abstract class _$TopCoinsController extends $AsyncNotifier<TopCoinModel> {
  FutureOr<TopCoinModel> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TopCoinModel>, TopCoinModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TopCoinModel>, TopCoinModel>,
              AsyncValue<TopCoinModel>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
