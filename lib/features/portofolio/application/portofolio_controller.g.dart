// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portofolio_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PortofolioController)
final portofolioControllerProvider = PortofolioControllerProvider._();

final class PortofolioControllerProvider
    extends
        $AsyncNotifierProvider<PortofolioController, List<PortofolioModel>> {
  PortofolioControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'portofolioControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$portofolioControllerHash();

  @$internal
  @override
  PortofolioController create() => PortofolioController();
}

String _$portofolioControllerHash() =>
    r'6c045e07769407c72446826f28eaeea8eb07851f';

abstract class _$PortofolioController
    extends $AsyncNotifier<List<PortofolioModel>> {
  FutureOr<List<PortofolioModel>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<PortofolioModel>>, List<PortofolioModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PortofolioModel>>,
                List<PortofolioModel>
              >,
              AsyncValue<List<PortofolioModel>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(portfolioSummary)
final portfolioSummaryProvider = PortfolioSummaryFamily._();

final class PortfolioSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<PortfolioSummary>,
          PortfolioSummary,
          FutureOr<PortfolioSummary>
        >
    with $FutureModifier<PortfolioSummary>, $FutureProvider<PortfolioSummary> {
  PortfolioSummaryProvider._({
    required PortfolioSummaryFamily super.from,
    required DisplayCurrency super.argument,
  }) : super(
         retry: null,
         name: r'portfolioSummaryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$portfolioSummaryHash();

  @override
  String toString() {
    return r'portfolioSummaryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PortfolioSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PortfolioSummary> create(Ref ref) {
    final argument = this.argument as DisplayCurrency;
    return portfolioSummary(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PortfolioSummaryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$portfolioSummaryHash() => r'591fe6b99cec78dfbc4853396f2ad5144680662c';

final class PortfolioSummaryFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<PortfolioSummary>, DisplayCurrency> {
  PortfolioSummaryFamily._()
    : super(
        retry: null,
        name: r'portfolioSummaryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PortfolioSummaryProvider call(DisplayCurrency currency) =>
      PortfolioSummaryProvider._(argument: currency, from: this);

  @override
  String toString() => r'portfolioSummaryProvider';
}

@ProviderFor(isFavorite)
final isFavoriteProvider = IsFavoriteFamily._();

final class IsFavoriteProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsFavoriteProvider._({
    required IsFavoriteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isFavoriteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isFavoriteHash();

  @override
  String toString() {
    return r'isFavoriteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return isFavorite(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoriteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isFavoriteHash() => r'15e77fbc6316e589cf19a60e277d8d43797f8123';

final class IsFavoriteFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  IsFavoriteFamily._()
    : super(
        retry: null,
        name: r'isFavoriteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsFavoriteProvider call(String id) =>
      IsFavoriteProvider._(argument: id, from: this);

  @override
  String toString() => r'isFavoriteProvider';
}
