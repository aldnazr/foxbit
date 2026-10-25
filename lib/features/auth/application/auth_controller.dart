import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foxbit/core/utils/pref_key.dart';

part 'auth_controller.g.dart';

class AuthState {
  final bool isAuthenticated;
  final String? username;

  const AuthState({required this.isAuthenticated, this.username});

  const AuthState.unauthenticated() : isAuthenticated = false, username = null;

  const AuthState.authenticated(String name)
    : isAuthenticated = true,
      username = name;
}

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  Future<AuthState> build() async {
    final pref = await SharedPreferences.getInstance();
    final isLogin = pref.getBool(PrefKey.isLogin.key) ?? false;
    final username = pref.getString(PrefKey.username.key);
    if (isLogin && username != null && username.isNotEmpty) {
      return AuthState.authenticated(username);
    }
    return const AuthState.unauthenticated();
  }

  Future<bool> login(String username, String password) async {
    final pref = await SharedPreferences.getInstance();
    final savedUsername = pref.getString(PrefKey.username.key);
    final savedPassword = pref.getString(PrefKey.password.key);

    if (savedUsername == username && savedPassword == password) {
      await pref.setBool(PrefKey.isLogin.key, true);
      state = AsyncData(AuthState.authenticated(username));
      return true;
    }
    return false;
  }

  Future<bool> register(String username, String password) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(PrefKey.username.key, username);
    await pref.setString(PrefKey.password.key, password);
    return true;
  }

  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(PrefKey.isLogin.key, false);
    state = const AsyncData(AuthState.unauthenticated());
  }
}
