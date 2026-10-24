import 'package:hive_ce/hive.dart';
import 'package:vault_chain/features/wallet/domain/watched_wallet.dart';

class WalletRepository {
  static const boxName = 'watchedWalletsBox';
  static const key = 'wallets';

  Future<Box> _box() async => Hive.openBox(boxName);

  Future<List<WatchedWallet>> load() async {
    final box = await _box();
    final stored = box.get(key, defaultValue: []);
    if (stored is List) {
      return stored
          .whereType<Map>()
          .map((e) => WatchedWallet.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }

  Future<void> save(List<WatchedWallet> wallets) async {
    final box = await _box();
    await box.put(key, wallets.map((w) => w.toJson()).toList());
  }
}
