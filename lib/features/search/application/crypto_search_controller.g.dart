// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_search_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cryptoSearch)
final cryptoSearchProvider = CryptoSearchFamily._();

final class CryptoSearchProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SearchCoin>>,
          List<SearchCoin>,
          FutureOr<List<SearchCoin>>
        >
    with $FutureModifier<List<SearchCoin>>, $FutureProvider<List<SearchCoin>> {
  CryptoSearchProvider._({
    required CryptoSearchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'cryptoSearchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cryptoSearchHash();

  @override
  String toString() {
    return r'cryptoSearchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<SearchCoin>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SearchCoin>> create(Ref ref) {
    final argument = this.argument as String;
    return cryptoSearch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CryptoSearchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cryptoSearchHash() => r'166b8860dc2f5a7a8f8fda8ce71465348a36b9fd';

final class CryptoSearchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<SearchCoin>>, String> {
  CryptoSearchFamily._()
    : super(
        retry: null,
        name: r'cryptoSearchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CryptoSearchProvider call(String query) =>
      CryptoSearchProvider._(argument: query, from: this);

  @override
  String toString() => r'cryptoSearchProvider';
}
