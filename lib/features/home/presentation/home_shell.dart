import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/app/widgets/app_bottom_nav_bar.dart';

class const HomeShell({
  super.key,
  required final StatefulNavigationShell navigationShell,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(navigationShell: navigationShell),
    );
  }
}
