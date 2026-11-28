// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CoinDetailController)
final coinDetailControllerProvider = CoinDetailControllerFamily._();

final class CoinDetailControllerProvider
    extends $AsyncNotifierProvider<CoinDetailController, CoinDetailState> {
  CoinDetailControllerProvider._({
    required CoinDetailControllerFamily super.from,
    required (String, DisplayCurrency) super.argument,
  }) : super(
         retry: null,
         name: r'coinDetailControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$coinDetailControllerHash();

  @override
  String toString() {
    return r'coinDetailControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CoinDetailController create() => CoinDetailController();

  @override
  bool operator ==(Object other) {
    return other is CoinDetailControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coinDetailControllerHash() =>
    r'234c2526dd4d697a0b0506b8f072d26ff65ecc36';

final class CoinDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CoinDetailController,
          AsyncValue<CoinDetailState>,
          CoinDetailState,
          FutureOr<CoinDetailState>,
          (String, DisplayCurrency)
        > {
  CoinDetailControllerFamily._()
    : super(
        retry: null,
        name: r'coinDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoinDetailControllerProvider call(String id, DisplayCurrency currency) =>
      CoinDetailControllerProvider._(argument: (id, currency), from: this);

  @override
  String toString() => r'coinDetailControllerProvider';
}

abstract class _$CoinDetailController extends $AsyncNotifier<CoinDetailState> {
  late final _$args = ref.$arg as (String, DisplayCurrency);
  String get id => _$args.$1;
  DisplayCurrency get currency => _$args.$2;

  FutureOr<CoinDetailState> build(String id, DisplayCurrency currency);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CoinDetailState>, CoinDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CoinDetailState>, CoinDetailState>,
              AsyncValue<CoinDetailState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
