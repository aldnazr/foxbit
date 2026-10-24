class GlobalMarket {
  final double totalMarketCapUsd;
  final double totalVolumeUsd;
  final double btcDominance;
  final double ethDominance;
  final double marketCapChange24h;

  const GlobalMarket({
    required this.totalMarketCapUsd,
    required this.totalVolumeUsd,
    required this.btcDominance,
    required this.ethDominance,
    required this.marketCapChange24h,
  });

  static GlobalMarket fromJson(Map<String, dynamic> json) {
    final data = json['data'] is Map
        ? Map<String, dynamic>.from(json['data'] as Map)
        : <String, dynamic>{};
    final tmc = data['total_market_cap'];
    final tv = data['total_volume'];
    final mcp = data['market_cap_percentage'];
    double readNum(dynamic v) {
      if (v is num) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? 0;
      return 0;
    }

    double readMap(dynamic map, String key) {
      if (map is Map) {
        return readNum(map[key]);
      }
      return 0;
    }

    return GlobalMarket(
      totalMarketCapUsd: readMap(tmc, 'usd'),
      totalVolumeUsd: readMap(tv, 'usd'),
      btcDominance: readMap(mcp, 'btc'),
      ethDominance: readMap(mcp, 'eth'),
      marketCapChange24h: readNum(data['market_cap_change_percentage_24h_usd']),
    );
  }
}
