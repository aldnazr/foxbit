import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/features/auth/application/auth_controller.dart';
import 'package:vault_chain/features/auth/presentation/login_page.dart';
import 'package:vault_chain/features/auth/presentation/register_page.dart';
import 'package:vault_chain/features/coin_detail/presentation/coin_detail_page.dart';
import 'package:vault_chain/features/home/presentation/home_shell.dart';
import 'package:vault_chain/features/insight/presentation/insight_page.dart';
import 'package:vault_chain/features/market/presentation/market_tab.dart';
import 'package:vault_chain/features/portofolio/presentation/portofolio_tab.dart';
import 'package:vault_chain/features/settings/presentation/setting_page.dart';
import 'package:vault_chain/features/wallet/presentation/wallet_detail_page.dart';
import 'package:vault_chain/features/wallet/presentation/wallet_page.dart';
import 'package:vault_chain/shared/models/coin_detail_args.dart';

part 'router.g.dart';

CustomTransitionPage<void> _fadeSlidePage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionDuration: AppDesign.base,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: AppDesign.curve,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.04),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<AsyncValue<AuthState>>(
      authControllerProvider,
      (_, _) => notifyListeners(),
    );
  }
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/market',
    refreshListenable: notifier,
    redirect: (context, state) {
      final authAsync = ref.read(authControllerProvider);
      final authState = authAsync.value;

      if (authState == null) {
        return null;
      }

      final isAuth = authState.isAuthenticated;
      final location = state.matchedLocation;
      final isAuthRoute = location == '/login' || location == '/register';

      if (!isAuth && !isAuthRoute) {
        return '/login';
      }
      if (isAuth && isAuthRoute) {
        return '/market';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/', redirect: (_, _) => '/market'),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => _fadeSlidePage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: '/register',
        pageBuilder: (context, state) => _fadeSlidePage(
          key: state.pageKey,
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) => _fadeSlidePage(
          key: state.pageKey,
          child: const SettingPage(),
        ),
      ),
      GoRoute(
        path: '/coin/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final args = state.extra as CoinDetailArgs?;
          return _fadeSlidePage(
            key: state.pageKey,
            child: CoinDetailPage(id: id, args: args),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/market',
                builder: (context, state) => const MarketTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/portofolio',
                builder: (context, state) => const PortofolioTab(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/insight',
                name: 'insight',
                builder: (context, state) => const InsightPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wallet',
                name: 'wallet',
                builder: (context, state) => const WalletPage(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'walletDetail',
                    builder: (context, state) =>
                        WalletDetailPage(walletId: state.pathParameters['id']!),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
