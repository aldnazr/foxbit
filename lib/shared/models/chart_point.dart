class ChartPoint {
  const ChartPoint({
    required this.time,
    required this.price,
    required this.volume,
  });

  final DateTime time;
  final double price;
  final double volume;
}
