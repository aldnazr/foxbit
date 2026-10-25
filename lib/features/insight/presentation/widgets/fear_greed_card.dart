import 'package:material_ui/material_ui.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/features/insight/domain/fear_greed.dart';

class FearGreedCard extends StatelessWidget {
  final FearGreed data;
  const FearGreedCard({super.key, required this.data});

  Color _colorFor(BuildContext context, int v) {
    if (v <= 24) return negativeColor(context);
    if (v <= 49) return warningColor(context);
    if (v <= 54) return defaultTertiaryColor(context);
    if (v <= 74) return appAccentColor(context);
    return positiveColor(context);
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorFor(context, data.value);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FEAR & GREED INDEX',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: defaultTertiaryColor(context),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.value.toString(),
                  style: TextStyle(
                    fontFamily: 'SFPro',
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.5,
                    color: color,
                  ),
                ),
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    data.classificationId(),
                    style: TextStyle(
                      fontSize: 15,
                      color: color,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: CustomPaint(
                painter: _SparklinePainter(
                  values: data.history.reversed.toList(),
                  color: color,
                  hairline: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<int> values;
  final Color color;
  final Color hairline;
  _SparklinePainter({
    required this.values,
    required this.color,
    required this.hairline,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (values.length < 2) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final minV = values.reduce((a, b) => a < b ? a : b).toDouble();
    final maxV = values.reduce((a, b) => a > b ? a : b).toDouble();
    final range = (maxV - minV).abs() < 0.001 ? 1.0 : (maxV - minV);
    final path = Path();
    for (var i = 0; i < values.length; i++) {
      final x = size.width * i / (values.length - 1);
      final y = size.height - ((values[i] - minV) / range) * size.height;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) => false;
}
