import 'package:foxbit/shared/widgets/default_appbar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/auth/application/auth_controller.dart';
import 'package:foxbit/features/settings/application/theme_controller.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  Widget _iconBadge(BuildContext context, IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: defaultContainer(context),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Icon(icon, size: 20),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: DefaultAppbar(title: 'Pengaturan'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Card(
              child: Column(
                children: [
                  ListTile(
                    minTileHeight: 70.0,
                    onTap: () => _showThemeDialog(context, ref),
                    leading: _iconBadge(
                      context,
                      brightness == Brightness.light
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                    ),
                    title: const Text('Tema'),
                    subtitle: const Text('Pilih tema aplikasi'),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: defaultTertiaryColor(context),
                    ),
                  ),
                  const Divider(indent: 72),
                  ListTile(
                    minTileHeight: 70.0,
                    leading: _iconBadge(context, Icons.logout),
                    title: const Text('Logout'),
                    subtitle: const Text('Keluar dari aplikasi'),
                    onTap: () {
                      ref.read(authControllerProvider.notifier).logout();
                    },
                  ),
                ],
              ),
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
          title: const Text('Pilih Tema'),
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
