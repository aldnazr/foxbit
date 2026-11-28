import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxbit/data/api/coin_gecko_api.dart';
import 'package:foxbit/data/api/endpoint.dart';
import 'package:foxbit/shared/models/search_coin_model.dart';

part 'crypto_search_controller.g.dart';

@riverpod
Future<List<SearchCoin>> cryptoSearch(Ref ref, String query) async {
  final trimmed = query.trim();
  if (trimmed.isEmpty) return const [];

  final result = await CoinGeckoApi().searchCoins(Endpoint.search(trimmed));
  return result.coins;
}
