import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/core/utils/util.dart';

class const _NavItem({required final String icon, required final String label});

class AppBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppBottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final items = const [
      _NavItem(icon: 'assets/icons/finance.svg', label: 'Pasar'),
      _NavItem(icon: 'assets/icons/star.svg', label: 'Portofolio'),
      _NavItem(icon: 'assets/icons/insight.svg', label: 'Insight'),
      _NavItem(icon: 'assets/icons/wallet.svg', label: 'Dompet'),
    ];

    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: defaultBackground(context),
        border: Border(
          top: BorderSide(
            color: isDark ? const Color(0xFF2C2C2E) : const Color(0xFFE5E5EA),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          final item = items[index];
          final color = isSelected
              ? Colors.blueAccent
              : (isDark ? Colors.grey[400] : Colors.grey[600]);

          return Expanded(
            child: InkWell(
              onTap: () => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    item.icon,
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
