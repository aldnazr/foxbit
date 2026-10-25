import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:foxbit/core/config/env.dart';
import 'package:foxbit/shared/models/coin_detail.dart';
import 'package:foxbit/shared/models/coin_ohlc.dart';
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

  Future<List<CoinOhlc>> getOhlc(String endpoint) async {
    final url = Uri.parse("$_baseUrl$endpoint");

    final response = await http.get(url, headers: _header);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return (body as List).map((e) => CoinOhlc.fromList(e)).toList();
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
