import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit/app/theme.dart';
import 'package:foxbit/app/widgets/app_bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  testWidgets('five tabs fit at 320 width and Cari opens /search', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final router = GoRouter(
      initialLocation: '/market',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => Scaffold(
            body: navigationShell,
            bottomNavigationBar: AppBottomNavBar(
              navigationShell: navigationShell,
            ),
            extendBody: true,
          ),
          branches: [
            for (final path in [
              '/market',
              '/portofolio',
              '/insight',
              '/wallet',
              '/search',
            ])
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: path,
                    builder: (context, state) => Center(child: Text(path)),
                  ),
                ],
              ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(theme: AppTheme.lightTheme, routerConfig: router),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(SvgPicture), findsNWidgets(5));

    await tester.tap(find.byType(SvgPicture).last);
    await tester.pumpAndSettle();

    expect(find.text('/search'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
