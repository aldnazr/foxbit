import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/util.dart';

class _NavItem {
  final String icon;
  const _NavItem({required this.icon});
}

class AppBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppBottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = appAccentColor(context);
    final items = const [
      _NavItem(icon: 'assets/icons/finance.svg'),
      _NavItem(icon: 'assets/icons/star.svg'),
      _NavItem(icon: 'assets/icons/insight.svg'),
      _NavItem(icon: 'assets/icons/wallet.svg'),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.viewPaddingOf(context).bottom + 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDesign.full),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isDark
                  ? AppDesign.dSurface.withValues(alpha: 0.72)
                  : AppDesign.lSurface.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(AppDesign.full),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final isSelected = index == currentIndex;
                final item = items[index];
                final color = isSelected ? accent : defaultTertiaryColor(context);

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => navigationShell.goBranch(
                    index,
                    initialLocation: index == navigationShell.currentIndex,
                  ),
                  child: AnimatedContainer(
                    duration: AppDesign.base,
                    curve: AppDesign.curve,
                    height: 44,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? accent.withValues(alpha: isDark ? 0.18 : 0.12)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(AppDesign.full),
                      border: Border.all(
                        color: isSelected
                            ? accent.withValues(alpha: isDark ? 0.55 : 0.35)
                            : Colors.transparent,
                      ),
                      boxShadow: isSelected && isDark
                          ? [
                              BoxShadow(
                                color: accent.withValues(alpha: 0.25),
                                blurRadius: 16,
                                spreadRadius: 1,
                              ),
                            ]
                          : null,
                    ),
                    child: SvgPicture.asset(
                      item.icon,
                      width: 22,
                      height: 22,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
