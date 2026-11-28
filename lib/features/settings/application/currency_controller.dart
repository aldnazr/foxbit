import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/pref_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'currency_controller.g.dart';

@Riverpod(keepAlive: true)
class CurrencyController extends _$CurrencyController {
  static final _key = PrefKey.displayCurrency.key;
  bool _userChanged = false;

  @override
  DisplayCurrency build() {
    _load();
    return DisplayCurrency.usd;
  }

  Future<void> _load() async {
    final pref = await SharedPreferences.getInstance();
    final raw = pref.getString(_key);
    if (_userChanged) return;
    state = DisplayCurrency.values.firstWhere(
      (c) => c.name == raw,
      orElse: () => DisplayCurrency.usd,
    );
  }

  Future<void> setCurrency(DisplayCurrency currency) async {
    _userChanged = true;
    state = currency;
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_key, currency.name);
  }
}
