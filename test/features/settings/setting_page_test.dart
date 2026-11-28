import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit/app/theme.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/features/settings/application/currency_controller.dart';
import 'package:foxbit/features/settings/presentation/setting_page.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('currency switch updates state at 320 width', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final container = ProviderContainer();
    addTearDown(container.dispose);

    tester.view.physicalSize = const Size(320, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          theme: AppTheme.lightTheme,
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const SettingPage(),
              ),
            ],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Mata uang'), findsOneWidget);

    await tester.tap(find.text('IDR'));
    await tester.pumpAndSettle();

    expect(
      container.read(currencyControllerProvider),
      DisplayCurrency.idr,
    );
  });
}
