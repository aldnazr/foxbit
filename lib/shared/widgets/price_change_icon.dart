import 'package:material_ui/material_ui.dart';
import 'package:foxbit/core/utils/util.dart';

class PriceChangeIcon extends StatelessWidget {
  final bool isPositive;
  final String? label;
  const PriceChangeIcon(this.isPositive, {super.key, this.label});

  @override
  Widget build(BuildContext context) {
    final color = isPositive ? positiveColor(context) : negativeColor(context);
    return Row(
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
  }
}
