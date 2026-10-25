import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:foxbit/core/network/dio_providers.dart';
import 'package:foxbit/features/insight/data/insight_remote_source.dart';
import 'package:foxbit/features/insight/domain/fear_greed.dart';
import 'package:foxbit/features/insight/domain/global_market.dart';
import 'package:foxbit/features/insight/domain/news_item.dart';
import 'package:foxbit/features/insight/domain/trending_coin.dart';

part 'insight_providers.g.dart';

@Riverpod(keepAlive: true)
InsightRemoteSource insightRemoteSource(Ref ref) {
  return InsightRemoteSource(
    coingeckoDio: ref.watch(coingeckoDioProvider),
    alternativeDio: ref.watch(alternativeDioProvider),
    rssDio: ref.watch(rssDioProvider),
  );
}

@riverpod
Future<FearGreed> fearGreed(Ref ref) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(hours: 1), link.close);
  ref.onDispose(timer.cancel);
  final source = ref.watch(insightRemoteSourceProvider);
  return source.fetchFearGreed();
}

@riverpod
Future<GlobalMarket> globalMarket(Ref ref) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 2), link.close);
  ref.onDispose(timer.cancel);
  final source = ref.watch(insightRemoteSourceProvider);
  return source.fetchGlobal();
}

@riverpod
Future<List<TrendingCoin>> trendingCoins(Ref ref) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 5), link.close);
  ref.onDispose(timer.cancel);
  final source = ref.watch(insightRemoteSourceProvider);
  return source.fetchTrending();
}

@riverpod
Future<List<NewsItem>> cryptoNews(Ref ref) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(minutes: 10), link.close);
  ref.onDispose(timer.cancel);
  final source = ref.watch(insightRemoteSourceProvider);
  return source.fetchNews();
}
