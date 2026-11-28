import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/formatter.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/coin_detail/widgets/chart_formatters.dart';
import 'package:foxbit/shared/models/chart_point.dart';
import 'package:material_ui/material_ui.dart';

const double _topPadding = 12;
const double _axisHeight = 30;

typedef _Palette = ({Color grid, Color muted, Color background, Color text});

/// Chart harga dengan label sumbu-Y mengambang di atas kurva.
///
/// [onScrub] dipanggil dengan titik terdekat saat jari menahan lalu menggeser
/// di atas chart, dan dengan null saat jari dilepas.
class PriceChart extends StatefulWidget {
  const PriceChart({
    super.key,
    required this.points,
    required this.currency,
    required this.lineColor,
    this.onScrub,
  });

  final List<ChartPoint> points;
  final DisplayCurrency currency;
  final Color lineColor;
  final ValueChanged<ChartPoint?>? onScrub;

  @override
  State<PriceChart> createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  final ValueNotifier<int?> _hover = ValueNotifier<int?>(null);
  late _ChartStats _stats = _ChartStats.from(widget.points);

  @override
  void didUpdateWidget(PriceChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.points, widget.points)) {
      _stats = _ChartStats.from(widget.points);
      _hover.value = null;
    }
  }

  @override
  void dispose() {
    _hover.dispose();
    super.dispose();
  }

  void _scrubTo(double dx, double width) {
    final points = widget.points;
    if (points.length < 2 || width <= 0) return;
    final index = _stats.nearestIndex(points, dx / width);
    if (index == _hover.value) return;
    _hover.value = index;
    widget.onScrub?.call(points[index]);
  }

  void _endScrub() {
    if (_hover.value == null) return;
    _hover.value = null;
    widget.onScrub?.call(null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = (
      grid: theme.colorScheme.outline,
      muted: defaultSecondaryColor(context),
      background: theme.scaffoldBackgroundColor,
      text: defaultTitleColor(context),
    );

    return Semantics(
      label:
          'Grafik harga, terendah '
          '${Formatter.formatCurrency(_stats.min, currency: widget.currency)}, '
          'tertinggi '
          '${Formatter.formatCurrency(_stats.max, currency: widget.currency)}. '
          'Tahan lalu geser untuk melihat harga per waktu.',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return RawGestureDetector(
            behavior: HitTestBehavior.opaque,
            gestures: <Type, GestureRecognizerFactory>{
              LongPressGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                    LongPressGestureRecognizer
                  >(
                    // Tahan 150 ms sebelum scrub, supaya swipe vertikal tetap menggulir halaman.
                    () => LongPressGestureRecognizer(
                      duration: const Duration(milliseconds: 150),
                    ),
                    (recognizer) {
                      recognizer
                        ..onLongPressStart = (details) {
                          HapticFeedback.selectionClick();
                          _scrubTo(details.localPosition.dx, width);
                        }
                        ..onLongPressMoveUpdate = (details) {
                          _scrubTo(details.localPosition.dx, width);
                        }
                        ..onLongPressEnd = (details) {
                          _endScrub();
                        }
                        ..onLongPressCancel = _endScrub;
                    },
                  ),
            },
            // Kurva dan crosshair di lapisan terpisah, jadi geser jari tidak menggambar ulang kurva.
            child: Stack(
              fit: StackFit.expand,
              children: [
                RepaintBoundary(
                  child: CustomPaint(
                    painter: _ChartPainter(
                      points: widget.points,
                      stats: _stats,
                      palette: palette,
                      currency: widget.currency,
                      lineColor: widget.lineColor,
                    ),
                  ),
                ),
                CustomPaint(
                  painter: _CrosshairPainter(
                    hover: _hover,
                    points: widget.points,
                    stats: _stats,
                    palette: palette,
                    lineColor: widget.lineColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ChartStats {
  const _ChartStats({
    required this.min,
    required this.max,
    required this.startMs,
    required this.spanMs,
    required this.priceTicks,
    required this.timeTicks,
  });

  factory _ChartStats.from(List<ChartPoint> points) {
    if (points.length < 2) {
      return const _ChartStats(
        min: 0,
        max: 1,
        startMs: 0,
        spanMs: 1,
        priceTicks: PriceTicks([], 1),
        timeTicks: [],
      );
    }

    var low = double.infinity;
    var high = double.negativeInfinity;
    for (final point in points) {
      low = math.min(low, point.price);
      high = math.max(high, point.price);
    }
    // Harga datar butuh sedikit ruang, kalau tidak pembagian skala jadi nol.
    if (high - low < 1e-12) {
      final pad = low.abs() * 0.005 + 1e-8;
      low -= pad;
      high += pad;
    }

    final start = points.first.time;
    final end = points.last.time;
    return _ChartStats(
      min: low,
      max: high,
      startMs: start.millisecondsSinceEpoch,
      spanMs: math.max(
        1,
        end.millisecondsSinceEpoch - start.millisecondsSinceEpoch,
      ),
      priceTicks: buildPriceTicks(low, high),
      timeTicks: buildTimeTicks(start, end),
    );
  }

  final double min;
  final double max;
  final int startMs;
  final int spanMs;
  final PriceTicks priceTicks;
  final List<TimeTick> timeTicks;

  /// Titik terdekat ke posisi [fraction] (0 sampai 1) di sepanjang sumbu waktu.
  int nearestIndex(List<ChartPoint> points, double fraction) {
    final target = startMs + fraction.clamp(0.0, 1.0) * spanMs;
    var lo = 0;
    var hi = points.length - 1;
    while (lo < hi) {
      final mid = (lo + hi) >> 1;
      if (points[mid].time.millisecondsSinceEpoch < target) {
        lo = mid + 1;
      } else {
        hi = mid;
      }
    }
    if (lo > 0) {
      final before = points[lo - 1].time.millisecondsSinceEpoch;
      final after = points[lo].time.millisecondsSinceEpoch;
      if (target - before <= after - target) lo--;
    }
    return lo;
  }
}

class _Geometry {
  _Geometry(this.points, this.stats, Size size)
    : plot = Rect.fromLTRB(
        0,
        _topPadding,
        size.width,
        size.height - _axisHeight,
      );

  final List<ChartPoint> points;
  final _ChartStats stats;
  final Rect plot;

  double xOfTime(DateTime time) =>
      plot.left +
      (time.millisecondsSinceEpoch - stats.startMs) / stats.spanMs * plot.width;

  double xAt(int index) => xOfTime(points[index].time);

  double yOf(double price) =>
      plot.bottom - (price - stats.min) / (stats.max - stats.min) * plot.height;
}

class _ChartPainter extends CustomPainter {
  _ChartPainter({
    required this.points,
    required this.stats,
    required this.palette,
    required this.currency,
    required this.lineColor,
  });

  final List<ChartPoint> points;
  final _ChartStats stats;
  final _Palette palette;
  final DisplayCurrency currency;
  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;
    final geometry = _Geometry(points, stats, size);
    final plot = geometry.plot;

    final gridPaint = Paint()
      ..color = palette.grid
      ..strokeWidth = 1;
    for (final value in stats.priceTicks.values) {
      final y = geometry.yOf(value);
      canvas.drawLine(Offset(plot.left, y), Offset(plot.right, y), gridPaint);
    }

    final line = Path()
      ..moveTo(geometry.xAt(0), geometry.yOf(points.first.price));
    for (var i = 1; i < points.length; i++) {
      line.lineTo(geometry.xAt(i), geometry.yOf(points[i].price));
    }

    final area = Path.from(line)
      ..lineTo(geometry.xAt(points.length - 1), plot.bottom)
      ..lineTo(geometry.xAt(0), plot.bottom)
      ..close();
    canvas.drawPath(
      area,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lineColor.withAlpha(96), lineColor.withAlpha(0)],
        ).createShader(plot),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = lineColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeJoin = StrokeJoin.round
        ..strokeCap = StrokeCap.round,
    );

    _paintPriceLabels(canvas, geometry);
    _paintTimeLabels(canvas, geometry, size.width);
  }

  void _paintPriceLabels(Canvas canvas, _Geometry geometry) {
    const fontSize = 11.0;
    final fillStyle = TextStyle(
      color: palette.muted,
      fontFamily: 'SFPro',
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
    // Halo tipis menjaga label tetap terbaca saat garis harga melewatinya.
    final haloStyle = TextStyle(
      fontFamily: 'SFPro',
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3
        ..strokeJoin = StrokeJoin.round
        ..color = palette.background,
    );

    final ticks = stats.priceTicks;
    for (final value in ticks.values) {
      final text = formatAxisPrice(value, ticks.step, currency);
      final fill = _layout(text, fillStyle);
      final halo = _layout(text, haloStyle);
      final dy = _clamp(
        geometry.yOf(value) - fill.height / 2,
        0,
        geometry.plot.bottom - fill.height,
      );
      halo.paint(canvas, Offset(6, dy));
      fill.paint(canvas, Offset(6, dy));
    }
  }

  void _paintTimeLabels(Canvas canvas, _Geometry geometry, double width) {
    final style = TextStyle(
      color: palette.muted,
      fontFamily: 'SFPro',
      fontSize: 11,
      fontWeight: FontWeight.w500,
    );
    for (final tick in stats.timeTicks) {
      final painter = _layout(formatTimeLabel(tick), style);
      final dx = _clamp(
        geometry.xOfTime(tick.time) - painter.width / 2,
        0,
        width - painter.width,
      );
      painter.paint(canvas, Offset(dx, geometry.plot.bottom + 10));
    }
  }

  @override
  bool shouldRepaint(_ChartPainter oldDelegate) =>
      !identical(oldDelegate.points, points) ||
      !identical(oldDelegate.stats, stats) ||
      oldDelegate.palette != palette ||
      oldDelegate.currency != currency ||
      oldDelegate.lineColor != lineColor;
}

class _CrosshairPainter extends CustomPainter {
  _CrosshairPainter({
    required this.hover,
    required this.points,
    required this.stats,
    required this.palette,
    required this.lineColor,
  }) : super(repaint: hover);

  final ValueListenable<int?> hover;
  final List<ChartPoint> points;
  final _ChartStats stats;
  final _Palette palette;
  final Color lineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final index = hover.value;
    if (index == null || points.length < 2 || index >= points.length) return;
    final geometry = _Geometry(points, stats, size);
    final plot = geometry.plot;
    final x = geometry.xAt(index);
    final y = geometry.yOf(points[index].price);

    // Bagian setelah titik yang disentuh diredupkan, seperti di aplikasi CoinGecko.
    canvas.drawRect(
      Rect.fromLTRB(x, 0, size.width, plot.bottom + 1),
      Paint()..color = palette.background.withAlpha(178),
    );

    final dashPaint = Paint()
      ..color = lineColor
      ..strokeWidth = 1.2;
    final bottom = plot.bottom + 6;
    for (var dy = plot.top; dy < bottom; dy += 6) {
      canvas.drawLine(
        Offset(x, dy),
        Offset(x, math.min(dy + 3, bottom)),
        dashPaint,
      );
    }

    final center = Offset(x, y);
    canvas.drawCircle(center, 6, Paint()..color = palette.background);
    canvas.drawCircle(
      center,
      6,
      Paint()
        ..color = palette.text
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
    canvas.drawCircle(center, 3.5, Paint()..color = lineColor);
  }

  @override
  bool shouldRepaint(_CrosshairPainter oldDelegate) =>
      !identical(oldDelegate.points, points) ||
      !identical(oldDelegate.stats, stats) ||
      oldDelegate.palette != palette ||
      oldDelegate.lineColor != lineColor;
}

TextPainter _layout(String text, TextStyle style) => TextPainter(
  text: TextSpan(text: text, style: style),
  textDirection: TextDirection.ltr,
  maxLines: 1,
)..layout();

double _clamp(double value, double low, double high) =>
    value < low ? low : (value > high ? high : value);
