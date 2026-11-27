import 'dart:math' as math;

import 'package:foxbit/shared/models/chart_point.dart';
import 'package:intl/intl.dart';

const _locale = 'id_ID';
const _dayMinutes = 24 * 60;
const _units = [(1e12, 'T'), (1e9, 'M'), (1e6, 'jt'), (1e3, 'rb')];

final _patterns = List<NumberFormat>.generate(
  9,
  (digits) =>
      NumberFormat.decimalPatternDigits(locale: _locale, decimalDigits: digits),
);

final _timeOfDay = DateFormat('HH.mm', _locale);
final _dayMonth = DateFormat('d MMM', _locale);
final _monthOnly = DateFormat('MMM', _locale);
final _yearOnly = DateFormat('yyyy', _locale);
final _dayMonthTime = DateFormat('d MMM, HH.mm', _locale);
final _dayMonthYear = DateFormat('d MMM yyyy', _locale);

bool isIntraday(List<ChartPoint> points) =>
    points.length > 1 &&
    points[1].time.difference(points[0].time) < const Duration(hours: 20);

String formatPointTime(DateTime time, {required bool intraday}) =>
    (intraday ? _dayMonthTime : _dayMonthYear).format(time);

class PriceTicks {
  const PriceTicks(this.values, this.step);

  final List<double> values;
  final double step;
}

PriceTicks buildPriceTicks(double min, double max, {int target = 5}) {
  final rough = (max - min) / target;
  final magnitude = math
      .pow(10, (math.log(rough) / math.ln10).floor())
      .toDouble();
  final residual = rough / magnitude;
  final factor = residual <= 1
      ? 1.0
      : residual <= 2
      ? 2.0
      : residual <= 2.5
      ? 2.5
      : residual <= 5
      ? 5.0
      : 10.0;
  final step = factor * magnitude;

  final values = <double>[];
  var i = (min / step).ceil();
  while (i * step <= max) {
    values.add(i * step);
    i++;
  }
  return PriceTicks(values, step);
}

enum TimeTickUnit { minute, day, month, year }

class TimeTick {
  const TimeTick(this.time, this.unit);

  final DateTime time;
  final TimeTickUnit unit;
}

String formatTimeLabel(TimeTick tick) => switch (tick.unit) {
  TimeTickUnit.minute => _timeOfDay.format(tick.time),
  TimeTickUnit.day => _dayMonth.format(tick.time),
  TimeTickUnit.month => _monthOnly.format(tick.time),
  TimeTickUnit.year => _yearOnly.format(tick.time),
};

String formatAxisPrice(double value, double step) {
  final magnitude = value.abs();
  for (final (size, suffix) in _units) {
    if (magnitude >= size) {
      final digits = _digits(step / size, 2);
      return 'Rp${_patterns[digits].format(value / size)}$suffix';
    }
  }
  final digits = _digits(step, magnitude < 1 ? 8 : 2);
  return 'Rp${_patterns[digits].format(value)}';
}

int _digits(double step, int maxDigits) {
  var digits = 0;
  var scaled = step.abs();
  while (digits < maxDigits && (scaled - scaled.roundToDouble()).abs() > 1e-9) {
    scaled *= 10;
    digits++;
  }
  return digits;
}

List<TimeTick> buildTimeTicks(DateTime start, DateTime end, {int target = 7}) {
  final spanMinutes = end.difference(start).inMinutes;
  if (spanMinutes <= 0) return const [];
  final rawStep = spanMinutes / target;

  const minuteSteps = [15, 30, 60, 120, 240, 360, 720, 1440, 2880, 7200, 20160];
  for (final step in minuteSteps) {
    if (step >= rawStep) return _ticksByMinutes(start, end, step);
  }

  const monthSteps = [1, 2, 3, 6, 12, 24, 36, 60, 120];
  final rawMonths = rawStep / (_dayMinutes * 30.44);
  final months = monthSteps.firstWhere(
    (m) => m >= rawMonths,
    orElse: () => 240,
  );
  return _ticksByMonths(start, end, months);
}

List<TimeTick> _ticksByMinutes(DateTime start, DateTime end, int step) {
  final intraday = step < _dayMinutes;
  final ticks = <TimeTick>[];
  var t = _firstTick(start, step);
  while (!t.isAfter(end)) {
    ticks.add(TimeTick(t, intraday ? TimeTickUnit.minute : TimeTickUnit.day));
    t = intraday
        ? t.add(Duration(minutes: step))
        : DateTime(t.year, t.month, t.day + step ~/ _dayMinutes);
  }
  return ticks;
}

DateTime _firstTick(DateTime start, int step) {
  final midnight = DateTime(start.year, start.month, start.day);
  if (step >= _dayMinutes) {
    return midnight.isBefore(start)
        ? DateTime(start.year, start.month, start.day + 1)
        : midnight;
  }
  final k = (start.difference(midnight).inSeconds / (step * 60)).ceil();
  return midnight.add(Duration(minutes: k * step));
}

List<TimeTick> _ticksByMonths(DateTime start, DateTime end, int months) {
  final unit = months >= 12 ? TimeTickUnit.year : TimeTickUnit.month;
  final stepYears = months ~/ 12;
  bool aligned(DateTime t) => months >= 12
      ? t.month == 1 && t.year % stepYears == 0
      : (t.month - 1) % months == 0;

  var t = DateTime(start.year, start.month);
  while (t.isBefore(start) || !aligned(t)) {
    t = DateTime(t.year, t.month + 1);
  }
  final ticks = <TimeTick>[];
  while (!t.isAfter(end)) {
    ticks.add(TimeTick(t, unit));
    t = DateTime(t.year, t.month + months);
  }
  return ticks;
}
