import 'package:foxbit/shared/widgets/default_appbar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/auth/application/auth_controller.dart';
import 'package:foxbit/features/settings/application/currency_controller.dart';
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
    final currency = ref.watch(currencyControllerProvider);

    return Scaffold(
      appBar: DefaultAppbar(title: 'Pengaturan'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Card(
              clipBehavior: .antiAlias,
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
                  const Divider(height: 1, thickness: 0.7),
                  _currencyTile(context, ref, currency),
                  const Divider(height: 1, thickness: 0.7),
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

  Widget _currencyTile(
    BuildContext context,
    WidgetRef ref,
    DisplayCurrency currency,
  ) {
    const title = Text('Mata uang');
    const subtitle = Text('Berlaku untuk semua nominal crypto.');
    final control = SegmentedButton<DisplayCurrency>(
      segments: const [
        ButtonSegment(value: DisplayCurrency.idr, label: Text('IDR')),
        ButtonSegment(value: DisplayCurrency.usd, label: Text('USD')),
      ],
      selected: {currency},
      showSelectedIcon: false,
      onSelectionChanged: (selection) {
        if (selection.isNotEmpty) {
          ref
              .read(currencyControllerProvider.notifier)
              .setCurrency(selection.first);
        }
      },
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 360) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _iconBadge(context, Icons.payments_outlined),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [title, SizedBox(height: 2), subtitle],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(alignment: Alignment.centerRight, child: control),
              ],
            ),
          );
        }
        return ListTile(
          minTileHeight: 70,
          leading: _iconBadge(context, Icons.payments_outlined),
          title: title,
          subtitle: subtitle,
          trailing: control,
        );
      },
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
              RadioGroup(
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
                    RadioListTile(title: Text('Light'), value: ThemeMode.light),
                    RadioListTile(title: Text('Dark'), value: ThemeMode.dark),
                    RadioListTile(
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
