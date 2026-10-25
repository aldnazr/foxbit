import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/core/utils/util.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: const EdgeInsets.only(right: 16.0),
      leadingWidth: 58,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: CircleAvatar(
          radius: 1,
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/app_logo.png', fit: .scaleDown),
        ),
      ),
      titleSpacing: 10,
      title: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: 'Fox'),
            TextSpan(
              text: 'bit',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        style: Theme.of(context).appBarTheme.titleTextStyle
            ?.copyWith(fontSize: 20, letterSpacing: -0.3),
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: defaultContainer(context),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: IconButton(
            tooltip: 'Pengaturan',
            onPressed: () => context.push('/settings'),
            icon: const Icon(Icons.settings_outlined, size: 20),
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    );
  }
}
