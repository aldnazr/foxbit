import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit/features/wallet/domain/watched_wallet.dart';
import 'package:foxbit/features/wallet/domain/wallet_validation.dart';

void main() {
  test('alamat valid diterima', () {
    expect(
      WalletValidation.validateAddress(
        Chain.btc,
        'bc1qar0srrr7xfkvy5lly43wntgrefbmccn3vggsqq',
        // ignore: quantity in range bech32
      ),
      isNull,
    );
    expect(
      WalletValidation.validateAddress(
        Chain.btc,
        '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2',
      ),
      isNull,
    );
    expect(
      WalletValidation.validateAddress(
        Chain.eth,
        '0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045',
      ),
      isNull,
    );
  });

  test('alamat invalid ditolak', () {
    expect(WalletValidation.validateAddress(Chain.eth, '0x123'), isNotNull);
    expect(
      WalletValidation.validateAddress(Chain.btc, 'NOT_AN_ADDRESS'),
      isNotNull,
    );
    expect(WalletValidation.validateAddress(Chain.eth, ''), isNotNull);
  });

  test('private key & seed phrase ditolak dan tidak lolos sebagai alamat', () {
    final pk =
        '4c0883a69102937d6231471b5dbb6204fe5129617082792ae468d01a3f36d3d0';
    final secretError = WalletValidation.validateAddress(Chain.eth, pk);
    expect(secretError, contains('private key'));

    final seed = List.filled(12, 'word').join(' ');
    final seedError = WalletValidation.validateAddress(Chain.btc, seed);
    expect(seedError, contains('private key'));
  });
}
