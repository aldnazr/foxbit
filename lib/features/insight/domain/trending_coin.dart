class TrendingCoin {
  final String id;
  final String name;
  final String symbol;
  final int? marketCapRank;
  final String? thumbUrl;
  final double? priceChange24h;

  const TrendingCoin({
    required this.id,
    required this.name,
    required this.symbol,
    this.marketCapRank,
    this.thumbUrl,
    this.priceChange24h,
  });

  static TrendingCoin fromJson(Map<String, dynamic> json) {
    // json is item
    final data = json['data'] is Map
        ? Map<String, dynamic>.from(json['data'] as Map)
        : <String, dynamic>{};
    final pcp = data['price_change_percentage_24h'];
    double? change;
    if (pcp is Map) {
      final usd = pcp['usd'];
      if (usd is num) change = usd.toDouble();
      if (usd is String) change = double.tryParse(usd);
    } else if (pcp is num) {
      change = pcp.toDouble();
    }
    return TrendingCoin(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      symbol: json['symbol']?.toString() ?? '',
      marketCapRank: (json['market_cap_rank'] is num)
          ? (json['market_cap_rank'] as num).toInt()
          : int.tryParse(json['market_cap_rank']?.toString() ?? ''),
      thumbUrl: json['small']?.toString() ?? json['thumb']?.toString(),
      priceChange24h: change,
    );
  }
}
