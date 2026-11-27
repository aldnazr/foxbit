import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:foxbit/core/config/env.dart';
import 'package:foxbit/shared/models/chart_point.dart';
import 'package:foxbit/shared/models/coin_detail.dart';
import 'package:foxbit/shared/models/market_model.dart';
import 'package:foxbit/shared/models/top_coin_model.dart';

class CoinGeckoApi {
  static final _baseUrl = Env.coingeckoBaseUrl;
  static final _header = {'x-cg-demo-api-key': Env.coingeckoDemoKey};

  Future<List<MarketModel>> getMarkets(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");
    final response = await http.get(url, headers: _header);

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((e) => MarketModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }
  }

  Future<CoinDetail> getDetails(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");

    final response = await http.get(url, headers: _header);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return CoinDetail.fromJson(body);
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }
  }

  Future<List<ChartPoint>> getMarketChart(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");

    final response = await http.get(url, headers: _header);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final prices = body['prices'];
      final volumes = body['total_volumes'];
      if (prices is! List) return const [];

      final volumeList = volumes is List ? volumes : const [];
      final points = <ChartPoint>[];

      for (var i = 0; i < prices.length; i++) {
        final entry = prices[i];
        if (entry is! List || entry.length < 2) continue;

        final timestamp = entry[0];
        final price = entry[1];
        if (timestamp is! num || price is! num) continue;

        final volumeEntry = i < volumeList.length ? volumeList[i] : null;
        final volume =
            volumeEntry is List &&
                volumeEntry.length > 1 &&
                volumeEntry[1] is num
            ? (volumeEntry[1] as num).toDouble()
            : 0.0;

        points.add(
          ChartPoint(
            time: DateTime.fromMillisecondsSinceEpoch(timestamp.toInt()),
            price: price.toDouble(),
            volume: volume,
          ),
        );
      }

      points.sort((a, b) => a.time.compareTo(b.time));
      return points;
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }
  }

  Future<TopCoinModel> getTrendings(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");

    final response = await http.get(url, headers: _header);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return TopCoinModel.fromJson(body);
    } else {
      throw Exception("Failed to fetch data: ${response.statusCode}");
    }
  }
}
