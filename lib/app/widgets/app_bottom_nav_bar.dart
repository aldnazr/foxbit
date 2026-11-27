import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}

class const AppBottomNavBar({
  super.key,
  required final StatefulNavigationShell navigationShell,
}) extends StatelessWidget {
  static const _items = <_NavItem>[
    _NavItem(icon: 'assets/icons/finance.svg', label: 'Market'),
    _NavItem(icon: 'assets/icons/star.svg', label: 'Portfolio'),
    _NavItem(icon: 'assets/icons/insight.svg', label: 'Insight'),
    _NavItem(icon: 'assets/icons/wallet.svg', label: 'Wallet'),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = navigationShell.currentIndex;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final accent = appAccentColor(context);
    final idle = defaultSecondaryColor(context);
    final strong = defaultTitleColor(context);
    final duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : AppDesign.base;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        0,
        16,
        MediaQuery.viewPaddingOf(context).bottom + 10,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDesign.full),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.05)
                  : Colors.black.withValues(alpha: 0.035),
              borderRadius: BorderRadius.circular(AppDesign.full),
              border: Border.all(color: AppDesign.hairline(brightness)),
            ),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: AppDesign.surface(brightness).withValues(alpha: 0.72),
                borderRadius: BorderRadius.circular(AppDesign.full),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final slot = constraints.maxWidth / _items.length;
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedPositioned(
                        duration: duration,
                        curve: AppDesign.curve,
                        left: slot * currentIndex + 6,
                        top: 6,
                        bottom: 6,
                        width: slot - 12,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: accent.withValues(
                              alpha: isDark ? 0.16 : 0.10,
                            ),
                            borderRadius: BorderRadius.circular(AppDesign.full),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < _items.length; i++)
                            Expanded(
                              child: _NavButton(
                                item: _items[i],
                                selected: i == currentIndex,
                                accent: accent,
                                idle: idle,
                                strong: strong,
                                duration: duration,
                                onTap: () => navigationShell.goBranch(
                                  i,
                                  initialLocation: i == currentIndex,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final _NavItem item;
  final bool selected;
  final Color accent;
  final Color idle;
  final Color strong;
  final Duration duration;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.selected,
    required this.accent,
    required this.idle,
    required this.strong,
    required this.duration,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _focused = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.selected;

    final color = selected
        ? widget.accent
        : (_hovered
              ? Color.lerp(widget.idle, widget.strong, 0.45)!
              : widget.idle);

    return MergeSemantics(
      child: Semantics(
        button: true,
        enabled: true,
        selected: selected,
        label: widget.item.label,
        child: Tooltip(
          message: widget.item.label,
          excludeFromSemantics: true,
          waitDuration: const Duration(milliseconds: 400),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(AppDesign.full),
              splashColor: widget.accent.withValues(alpha: 0.14),
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onHover: (hovered) {
                if (_hovered != hovered) {
                  setState(() => _hovered = hovered);
                }
              },
              onFocusChange: (focused) {
                if (_focused != focused) {
                  setState(() => _focused = focused);
                }
              },
              child: SizedBox.expand(
                child: Center(
                  child: AnimatedContainer(
                    duration: widget.duration,
                    curve: AppDesign.curve,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDesign.full),
                      border: Border.all(
                        color: _focused ? widget.accent : Colors.transparent,
                        width: 1.5,
                      ),
                      boxShadow: _focused
                          ? [
                              BoxShadow(
                                color: widget.accent.withValues(alpha: 0.25),
                                blurRadius: 12,
                              ),
                            ]
                          : null,
                    ),
                    child: AnimatedScale(
                      duration: widget.duration,
                      curve: AppDesign.curve,
                      scale: selected ? 1.08 : 1,
                      child: ExcludeSemantics(
                        child: SvgPicture.asset(
                          widget.item.icon,
                          width: 22,
                          height: 22,
                          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
