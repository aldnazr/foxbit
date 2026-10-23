// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WalletsController)
final walletsControllerProvider = WalletsControllerProvider._();

final class WalletsControllerProvider
    extends $AsyncNotifierProvider<WalletsController, List<WatchedWallet>> {
  WalletsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walletsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walletsControllerHash();

  @$internal
  @override
  WalletsController create() => WalletsController();
}

String _$walletsControllerHash() => r'2dbf56ed83060c90d559e9d1ef9b358f606f3c8f';

abstract class _$WalletsController extends $AsyncNotifier<List<WatchedWallet>> {
  FutureOr<List<WatchedWallet>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<WatchedWallet>>, List<WatchedWallet>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WatchedWallet>>, List<WatchedWallet>>,
              AsyncValue<List<WatchedWallet>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(mempoolSource)
final mempoolSourceProvider = MempoolSourceProvider._();

final class MempoolSourceProvider
    extends $FunctionalProvider<MempoolSource, MempoolSource, MempoolSource>
    with $Provider<MempoolSource> {
  MempoolSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mempoolSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mempoolSourceHash();

  @$internal
  @override
  $ProviderElement<MempoolSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MempoolSource create(Ref ref) {
    return mempoolSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MempoolSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MempoolSource>(value),
    );
  }
}

String _$mempoolSourceHash() => r'249653f8466b4491cf03c0f2d27e10e3b9dd3afe';

@ProviderFor(etherscanSource)
final etherscanSourceProvider = EtherscanSourceProvider._();

final class EtherscanSourceProvider
    extends
        $FunctionalProvider<EtherscanSource, EtherscanSource, EtherscanSource>
    with $Provider<EtherscanSource> {
  EtherscanSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'etherscanSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$etherscanSourceHash();

  @$internal
  @override
  $ProviderElement<EtherscanSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EtherscanSource create(Ref ref) {
    return etherscanSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EtherscanSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EtherscanSource>(value),
    );
  }
}

String _$etherscanSourceHash() => r'3c544e1b149011fe103d06a32f2902a4bd8ba421';

@ProviderFor(walletBalance)
final walletBalanceProvider = WalletBalanceFamily._();

final class WalletBalanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<WalletBalance>,
          WalletBalance,
          FutureOr<WalletBalance>
        >
    with $FutureModifier<WalletBalance>, $FutureProvider<WalletBalance> {
  WalletBalanceProvider._({
    required WalletBalanceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'walletBalanceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$walletBalanceHash();

  @override
  String toString() {
    return r'walletBalanceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<WalletBalance> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WalletBalance> create(Ref ref) {
    final argument = this.argument as String;
    return walletBalance(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletBalanceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$walletBalanceHash() => r'0038b03d5caff0ac942be286ec420296136a8fa5';

final class WalletBalanceFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<WalletBalance>, String> {
  WalletBalanceFamily._()
    : super(
        retry: null,
        name: r'walletBalanceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WalletBalanceProvider call(String walletId) =>
      WalletBalanceProvider._(argument: walletId, from: this);

  @override
  String toString() => r'walletBalanceProvider';
}

@ProviderFor(walletTxs)
final walletTxsProvider = WalletTxsFamily._();

final class WalletTxsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WalletTx>>,
          List<WalletTx>,
          FutureOr<List<WalletTx>>
        >
    with $FutureModifier<List<WalletTx>>, $FutureProvider<List<WalletTx>> {
  WalletTxsProvider._({
    required WalletTxsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'walletTxsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$walletTxsHash();

  @override
  String toString() {
    return r'walletTxsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<WalletTx>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WalletTx>> create(Ref ref) {
    final argument = this.argument as String;
    return walletTxs(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WalletTxsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$walletTxsHash() => r'2efb1a99515bec49f0bd370e8fd9cf682ad3d0e6';

final class WalletTxsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<WalletTx>>, String> {
  WalletTxsFamily._()
    : super(
        retry: null,
        name: r'walletTxsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WalletTxsProvider call(String walletId) =>
      WalletTxsProvider._(argument: walletId, from: this);

  @override
  String toString() => r'walletTxsProvider';
}

@ProviderFor(fiatPrices)
final fiatPricesProvider = FiatPricesProvider._();

final class FiatPricesProvider
    extends
        $FunctionalProvider<
          AsyncValue<FiatPrices>,
          FiatPrices,
          FutureOr<FiatPrices>
        >
    with $FutureModifier<FiatPrices>, $FutureProvider<FiatPrices> {
  FiatPricesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fiatPricesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fiatPricesHash();

  @$internal
  @override
  $FutureProviderElement<FiatPrices> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<FiatPrices> create(Ref ref) {
    return fiatPrices(ref);
  }
}

String _$fiatPricesHash() => r'd9b50c61b4d8936b90f646f058b02a19f9089e1d';
