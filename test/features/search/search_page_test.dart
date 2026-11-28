import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit/app/theme.dart';
import 'package:foxbit/features/search/application/crypto_search_controller.dart';
import 'package:foxbit/features/search/presentation/search_page.dart';
import 'package:foxbit/shared/models/coin_detail_args.dart';
import 'package:foxbit/shared/models/search_coin_model.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

Widget _app(
  Future<List<SearchCoin>> Function(String query) search, {
  ThemeData? theme,
}) {
  final router = GoRouter(
    initialLocation: '/search',
    routes: [
      GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
      GoRoute(
        path: '/coin/:id',
        builder: (context, state) {
          final args = state.extra as CoinDetailArgs?;
          return Scaffold(body: Text('detail ${args?.name ?? 'unknown'}'));
        },
      ),
    ],
  );

  return ProviderScope(
    overrides: [
      cryptoSearchProvider.overrideWith((ref, query) => search(query)),
    ],
    child: MaterialApp.router(
      theme: theme ?? AppTheme.lightTheme,
      routerConfig: router,
    ),
  );
}

void _phoneSize(WidgetTester tester, [double width = 320]) {
  tester.view.physicalSize = Size(width, 800);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void main() {
  testWidgets('shows the initial state without calling the API', (
    tester,
  ) async {
    _phoneSize(tester);
    var calls = 0;

    await tester.pumpWidget(
      _app((query) async {
        calls++;
        return const <SearchCoin>[];
      }),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Cari koin'), findsOneWidget);
    expect(find.text('Cari kripto'), findsOneWidget);
    expect(calls, 0);
  });

  testWidgets('shows results and opens coin detail', (tester) async {
    _phoneSize(tester);

    await tester.pumpWidget(
      _app((query) async {
        return const [
          SearchCoin(
            id: 'bitcoin',
            name: 'Bitcoin',
            symbol: 'btc',
            marketCapRank: 1,
          ),
        ];
      }),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'bitcoin');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.text('BTC'), findsOneWidget);
    expect(find.text('#1'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.text('Bitcoin'));
    await tester.pumpAndSettle();

    expect(find.text('detail Bitcoin'), findsOneWidget);
  });

  testWidgets('shows the empty state for a query with no matches', (
    tester,
  ) async {
    _phoneSize(tester);

    await tester.pumpWidget(_app((query) async => const <SearchCoin>[]));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'zzzzzz');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text('Tidak ada hasil untuk "zzzzzz"'), findsOneWidget);
    expect(
      find.text('Periksa ejaan atau coba nama atau simbol lain.'),
      findsOneWidget,
    );
  });

  testWidgets('shows the loading skeleton while the search runs', (
    tester,
  ) async {
    _phoneSize(tester);
    final completer = Completer<List<SearchCoin>>();

    await tester.pumpWidget(_app((query) => completer.future));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'bitcoin');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump();

    expect(find.bySemanticsLabel('Mencari koin'), findsOneWidget);

    completer.complete(const <SearchCoin>[]);
    await tester.pumpAndSettle();
  });

  testWidgets('shows the error state and retries', (tester) async {
    _phoneSize(tester);
    var calls = 0;

    await tester.pumpWidget(
      _app((query) async {
        calls++;
        throw Exception('offline');
      }),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'bitcoin');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(
      find.text('Pencarian gagal. Periksa koneksi lalu coba lagi.'),
      findsOneWidget,
    );
    expect(find.text('Coba lagi'), findsOneWidget);
    expect(calls, greaterThanOrEqualTo(1));

    final callsBeforeRetry = calls;
    await tester.tap(find.text('Coba lagi'));
    await tester.pumpAndSettle();

    expect(calls, greaterThan(callsBeforeRetry));
  });

  testWidgets('clear button resets to the initial state', (tester) async {
    _phoneSize(tester);

    await tester.pumpWidget(_app((query) async => const <SearchCoin>[]));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'bitcoin');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();
    expect(find.text('bitcoin'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();

    expect(find.text('bitcoin'), findsNothing);
    expect(find.text('Cari koin'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('renders in dark theme at 360 width without overflow', (
    tester,
  ) async {
    _phoneSize(tester, 360);

    await tester.pumpWidget(
      _app(
        (query) async => const [
          SearchCoin(
            id: 'bitcoin',
            name: 'Bitcoin',
            symbol: 'btc',
            marketCapRank: 1,
          ),
        ],
        theme: AppTheme.darkTheme,
      ),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'bitcoin');
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text('Bitcoin'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
