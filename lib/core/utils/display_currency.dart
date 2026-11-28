enum DisplayCurrency {
  idr(label: 'IDR', symbol: 'Rp ', locale: 'id_ID'),
  usd(label: 'USD', symbol: r'$', locale: 'en_US');

  const DisplayCurrency({
    required this.label,
    required this.symbol,
    required this.locale,
  });

  final String label;
  final String symbol;
  final String locale;
}
