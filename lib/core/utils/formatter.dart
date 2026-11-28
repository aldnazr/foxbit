import 'package:foxbit/core/utils/display_currency.dart';
import 'package:intl/intl.dart';

class Formatter {
  static String formatCurrency(
    num value, {
    required DisplayCurrency currency,
  }) => NumberFormat.currency(
    locale: currency.locale,
    symbol: currency.symbol,
    decimalDigits: _decimalDigits(value, currency),
  ).format(value);

  static String formatCompactCurrency(num value, DisplayCurrency currency) =>
      NumberFormat.compactCurrency(
        locale: currency.locale,
        symbol: currency.symbol,
        decimalDigits: 1,
      ).format(value).replaceAll('\u00A0', ' ');

  static String formatCurrencyWithoutSymbol(
    num value, {
    required DisplayCurrency currency,
  }) => NumberFormat.currency(
    locale: currency.locale,
    symbol: '',
    decimalDigits: _decimalDigits(value, currency),
  ).format(value);

  static int _decimalDigits(num value, DisplayCurrency currency) {
    final magnitude = value.abs();
    return switch (currency) {
      DisplayCurrency.usd =>
        magnitude >= 1
            ? 2
            : magnitude >= 0.01
            ? 4
            : magnitude >= 0.0001
            ? 6
            : 8,
      DisplayCurrency.idr =>
        magnitude >= 1
            ? 0
            : magnitude >= 0.01
            ? 2
            : magnitude >= 0.0001
            ? 4
            : 6,
    };
  }

  static String formatPercent(num percentage) {
    final formatter = NumberFormat.decimalPattern('id_ID');
    final formatted = formatter.format(
      double.parse(percentage.toStringAsFixed(2)),
    );
    return '${formatted.replaceFirst('-', '')}%';
  }
}
