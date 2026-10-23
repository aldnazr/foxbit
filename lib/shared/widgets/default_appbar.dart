import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/core/utils/util.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actionsPadding: const EdgeInsets.only(right: 16.0),
      leadingWidth: 58,
      leading: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/app_logo.png'),
        ),
      ),
      titleSpacing: 10,
      title: Text(
        'Vault Chain',
        style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
              fontSize: 18,
              letterSpacing: -0.3,
            ),
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
