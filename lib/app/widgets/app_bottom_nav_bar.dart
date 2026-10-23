import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/util.dart';

class _NavItem {
  final String icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

class AppBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppBottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final items = const [
      _NavItem(icon: 'assets/icons/finance.svg', label: 'Pasar'),
      _NavItem(icon: 'assets/icons/star.svg', label: 'Portofolio'),
      _NavItem(icon: 'assets/icons/insight.svg', label: 'Insight'),
      _NavItem(icon: 'assets/icons/wallet.svg', label: 'Dompet'),
    ];

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.viewPaddingOf(context).bottom + 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDesign.full),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            height: 64,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isDark
                  ? AppDesign.dSurface.withValues(alpha: 0.72)
                  : AppDesign.lSurface.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(AppDesign.full),
              border: Border.all(color: Theme.of(context).colorScheme.outline),
            ),
            child: Row(
              children: List.generate(items.length, (index) {
                final isSelected = index == currentIndex;
                final item = items[index];
                final color = isSelected
                    ? appAccentColor(context)
                    : defaultTertiaryColor(context);

                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => navigationShell.goBranch(
                      index,
                      initialLocation: index == navigationShell.currentIndex,
                    ),
                    child: AnimatedContainer(
                      duration: AppDesign.base,
                      curve: AppDesign.curve,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? appAccentColor(context).withValues(alpha: 0.12)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppDesign.full),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            item.icon,
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                          ),
                          AnimatedSize(
                            duration: AppDesign.base,
                            curve: AppDesign.curve,
                            child: isSelected
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                      item.label,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: color,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
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
