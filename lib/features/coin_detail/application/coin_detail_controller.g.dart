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
    required String super.argument,
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
        '($argument)';
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
    r'1900592a733a09bcd35b7ebb00e00abf4f10387a';

final class CoinDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          CoinDetailController,
          AsyncValue<CoinDetailState>,
          CoinDetailState,
          FutureOr<CoinDetailState>,
          String
        > {
  CoinDetailControllerFamily._()
    : super(
        retry: null,
        name: r'coinDetailControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CoinDetailControllerProvider call(String id) =>
      CoinDetailControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'coinDetailControllerProvider';
}

abstract class _$CoinDetailController extends $AsyncNotifier<CoinDetailState> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<CoinDetailState> build(String id);
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
    return element.handleCreate(ref, () => build(_$args));
  }
}
