import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/data/services/providers/detail_provider.dart';
import 'package:vault_chain/data/services/providers/filter_provider.dart';
import 'package:vault_chain/data/services/providers/market_provider.dart';
import 'package:vault_chain/presentation/states/tab_provider.dart';
import 'package:vault_chain/data/services/providers/top_coin_provider.dart';
import 'package:vault_chain/data/services/providers/portofolio_provider.dart';
import 'package:vault_chain/data/services/providers/scroll_provider.dart';
import 'package:vault_chain/presentation/states/theme_provider.dart';
import 'package:vault_chain/presentation/pages/coin_detail_page.dart';
import 'package:vault_chain/presentation/pages/home/home_screen.dart';
import 'package:vault_chain/presentation/pages/auth/login_page.dart';
import 'package:vault_chain/presentation/pages/auth/register_page.dart';
import 'package:vault_chain/presentation/pages/setting_page.dart';

final ValueNotifier<Key> appKeyNotifier = ValueNotifier(Key('initial'));
=======
import 'package:vault_chain/app/app.dart';
>>>>>>> main

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);

<<<<<<< HEAD
  // Cek login
  final bool isLoggedIn = await isLogin() ?? false;

  runApp(
    ValueListenableBuilder<Key>(
      valueListenable: appKeyNotifier,
      builder: (context, key, _) => ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: MyApp(key: key, isLoggedIn: isLoggedIn),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MarketProvider()..init()),
        ChangeNotifierProvider(create: (_) => TopCoinProvider()..init()),
        ChangeNotifierProvider(
          create: (_) => DetailProvider(),
          child: CoinDetailPage(),
        ),
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ChangeNotifierProvider(create: (_) => PortofolioProvider()..init()),
        ChangeNotifierProvider(create: (_) => TabProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedIn ? const HomeScreen() : const LoginPage(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/register': (context) => const RegisterPage(),
          '/login': (context) => const LoginPage(),
          '/detail_page': (context) => const CoinDetailPage(),
          '/setting': (context) => const SettingPage(),
        },
        themeMode: themeProvider.themeMode,
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          dividerTheme: DividerThemeData(color: darkBorderColor()),
          textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'SFPro'),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
            brightness: Brightness.dark,
            primaryContainer: customDarkContainer(),
            onPrimaryContainer: customDarkOnContainer(),
          ),
          cardTheme: CardThemeData(
            margin: EdgeInsets.all(0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
              side: BorderSide(
                style: BorderStyle.solid,
                color: darkBorderColor(),
                width: 2,
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: darkBorderColor(), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: darkBorderColor(), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onError,
                width: 2,
              ),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 48)),
              elevation: WidgetStateProperty.all(2),
              backgroundColor: WidgetStatePropertyAll(Color(0xFF0079FE)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 48)),
              elevation: WidgetStateProperty.all(2),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
        theme: ThemeData(
          dividerTheme: DividerThemeData(color: lightBorderColor()),
          fontFamily: 'SFPro',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
            surface: Colors.white,
            primaryContainer: customLightContainer(),
            onPrimaryContainer: customLightOnContainer(),
          ),
          cardTheme: CardThemeData(
            margin: EdgeInsets.all(0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
              side: BorderSide(
                style: BorderStyle.solid,
                color: lightBorderColor(),
                width: 2,
              ),
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            filled: false,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: lightBorderColor(), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: lightBorderColor(), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onError,
                width: 2,
              ),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 48)),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStateProperty.all(2),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 48)),
              elevation: WidgetStateProperty.all(1),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
=======
  runApp(const ProviderScope(child: VaultChainApp()));
>>>>>>> main
}
