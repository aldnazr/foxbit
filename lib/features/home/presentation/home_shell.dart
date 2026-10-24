import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/app/widgets/app_bottom_nav_bar.dart';
import 'package:vault_chain/shared/widgets/default_appbar.dart';

class HomeShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(),
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(navigationShell: navigationShell),
    );
  }
}
