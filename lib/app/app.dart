import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxbit/app/router.dart';
import 'package:foxbit/app/theme.dart';
import 'package:foxbit/features/settings/application/theme_controller.dart';

class FoxbitApp extends ConsumerWidget {
  const FoxbitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Foxbit',
      routerConfig: router,
      themeMode: themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
