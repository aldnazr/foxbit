import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/pref_key.dart';
import 'package:foxbit/features/settings/application/currency_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('defaults to USD when no preference is stored', () async {
    final container = ProviderContainer.test();

    expect(container.read(currencyControllerProvider), DisplayCurrency.usd);
    await pumpEventQueue();
    expect(container.read(currencyControllerProvider), DisplayCurrency.usd);
  });

  test('saves IDR and loads it again', () async {
    final container = ProviderContainer.test();
    await container
        .read(currencyControllerProvider.notifier)
        .setCurrency(DisplayCurrency.idr);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString(PrefKey.displayCurrency.key), 'idr');

    final restored = ProviderContainer.test();
    expect(restored.read(currencyControllerProvider), DisplayCurrency.usd);
    await pumpEventQueue();
    expect(restored.read(currencyControllerProvider), DisplayCurrency.idr);
  });
}
