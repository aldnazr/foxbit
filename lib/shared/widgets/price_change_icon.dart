import 'package:flutter/material.dart';
import 'package:vault_chain/core/utils/util.dart';

class PriceChangeIcon extends StatelessWidget {
  final bool isPositive;
  final String? label;
  const PriceChangeIcon(this.isPositive, {super.key, this.label});

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? positiveColor(context) : negativeColor(context);
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          color: color,
          size: 18,
        ),
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: child,
    );
  }
}
