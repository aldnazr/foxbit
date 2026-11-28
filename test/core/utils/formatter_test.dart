import 'package:flutter_test/flutter_test.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/formatter.dart';

void main() {
  group('Formatter.formatCurrency', () {
    test('formats IDR without decimals for one and above', () {
      expect(
        Formatter.formatCurrency(1234, currency: DisplayCurrency.idr),
        'Rp 1.234',
      );
    });

    test('formats USD with two decimals for one and above', () {
      expect(
        Formatter.formatCurrency(1234.56, currency: DisplayCurrency.usd),
        r'$1,234.56',
      );
    });

    test('keeps precision for cheap USD coins', () {
      expect(
        Formatter.formatCurrency(0.00001234, currency: DisplayCurrency.usd),
        r'$0.00001234',
      );
    });

    test('uses adaptive decimals for IDR below one', () {
      expect(
        Formatter.formatCurrency(0.5, currency: DisplayCurrency.idr),
        'Rp 0,50',
      );
    });
  });

  group('Formatter.formatCompactCurrency', () {
    test('formats large USD values compactly', () {
      expect(
        Formatter.formatCompactCurrency(2100000000000, DisplayCurrency.usd),
        r'$2.1T',
      );
    });

    test('formats large IDR values compactly', () {
      expect(
        Formatter.formatCompactCurrency(38300000000000, DisplayCurrency.idr),
        'Rp 38,3 T',
      );
    });
  });
}
