import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/features/auth/application/auth_controller.dart';
import 'package:vault_chain/features/settings/application/theme_controller.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(title: const Text('Pengaturan')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ListTile(
              minTileHeight: 70.0,
              onTap: () => _showThemeDialog(context, ref),
              leading: Icon(
                brightness == Brightness.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              title: const Text('Tema'),
              subtitle: const Text('Pilih tema aplikasi'),
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              minTileHeight: 70.0,
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              subtitle: const Text('Keluar dari aplikasi'),
              onTap: () {
                ref.read(authControllerProvider.notifier).logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    final currentMode = ref.read(themeControllerProvider);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Pilih Tema',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioGroup<ThemeMode>(
                groupValue: currentMode,
                onChanged: (mode) {
                  if (mode != null) {
                    ref
                        .read(themeControllerProvider.notifier)
                        .setThemeMode(mode);
                  }
                  context.pop();
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<ThemeMode>(
                      title: Text('Light'),
                      value: ThemeMode.light,
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text('Dark'),
                      value: ThemeMode.dark,
                    ),
                    RadioListTile<ThemeMode>(
                      title: Text('System'),
                      value: ThemeMode.system,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
