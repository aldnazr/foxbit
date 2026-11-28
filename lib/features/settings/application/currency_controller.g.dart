// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrencyController)
final currencyControllerProvider = CurrencyControllerProvider._();

final class CurrencyControllerProvider
    extends $NotifierProvider<CurrencyController, DisplayCurrency> {
  CurrencyControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currencyControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currencyControllerHash();

  @$internal
  @override
  CurrencyController create() => CurrencyController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DisplayCurrency value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DisplayCurrency>(value),
    );
  }
}

String _$currencyControllerHash() =>
    r'f051bfcbdf993a508a955bcb63a8d963fa15fbc0';

abstract class _$CurrencyController extends $Notifier<DisplayCurrency> {
  DisplayCurrency build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<DisplayCurrency, DisplayCurrency>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DisplayCurrency, DisplayCurrency>,
              DisplayCurrency,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
