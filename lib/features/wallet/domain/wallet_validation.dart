import 'package:foxbit/features/wallet/domain/watched_wallet.dart';

class WalletValidation {
  static String? validateAddress(Chain chain, String raw) {
    final addr = raw.trim();
    if (addr.isEmpty) return 'Alamat wajib diisi';

    // reject secrets
    final secretError = _rejectSecret(addr);
    if (secretError != null) return secretError;

    if (chain == Chain.eth) {
      final ethRe = RegExp(r'^0x[a-fA-F0-9]{40}$');
      if (!ethRe.hasMatch(addr)) return 'Format alamat ETH tidak valid';
    } else {
      final bech32 = RegExp(r'^bc1[a-z0-9]{25,87}$');
      final legacy = RegExp(r'^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$');
      if (!bech32.hasMatch(addr) && !legacy.hasMatch(addr)) {
        return 'Format alamat BTC tidak valid';
      }
    }
    return null;
  }

  static String? _rejectSecret(String input) {
    // 64 hex chars (private key)
    if (RegExp(r'^[0-9a-fA-F]{64}$').hasMatch(input)) {
      return 'Itu terlihat seperti private key/seed phrase. Jangan dimasukkan di sini.';
    }
    // 12+ words
    final words = input
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .toList();
    if (words.length >= 12) {
      return 'Itu terlihat seperti private key/seed phrase. Jangan dimasukkan di sini.';
    }
    return null;
  }
}
