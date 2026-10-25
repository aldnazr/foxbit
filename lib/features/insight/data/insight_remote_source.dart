import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:xml/xml.dart';

import 'package:foxbit/core/config/env.dart';
import 'package:foxbit/core/error/app_failure.dart';
import 'package:foxbit/core/network/dio_error_mapper.dart';
import 'package:foxbit/features/insight/domain/fear_greed.dart';
import 'package:foxbit/features/insight/domain/global_market.dart';
import 'package:foxbit/features/insight/domain/news_item.dart';
import 'package:foxbit/features/insight/domain/trending_coin.dart';

class InsightRemoteSource {
  final Dio coingeckoDio;
  final Dio alternativeDio;
  final Dio rssDio;

  InsightRemoteSource({
    required this.coingeckoDio,
    required this.alternativeDio,
    required this.rssDio,
  });

  Future<FearGreed> fetchFearGreed() async {
    try {
      final res = await alternativeDio.get(
        '/fng/',
        queryParameters: {'limit': 30},
      );
      final data = res.data is Map
          ? Map<String, dynamic>.from(res.data as Map)
          : <String, dynamic>{};
      return FearGreed.fromJson(data);
    } catch (e) {
      throw mapDioError(e);
    }
  }

  Future<GlobalMarket> fetchGlobal() async {
    try {
      final res = await coingeckoDio.get('/global');
      final data = res.data is Map
          ? Map<String, dynamic>.from(res.data as Map)
          : <String, dynamic>{};
      return GlobalMarket.fromJson(data);
    } catch (e) {
      throw mapDioError(e);
    }
  }

  Future<List<TrendingCoin>> fetchTrending() async {
    try {
      final res = await coingeckoDio.get('/search/trending');
      final data = res.data is Map
          ? Map<String, dynamic>.from(res.data as Map)
          : <String, dynamic>{};
      final coins = (data['coins'] as List?) ?? const [];
      return coins
          .whereType<Map>()
          .map((e) {
            final item = e['item'];
            if (item is Map) {
              return TrendingCoin.fromJson(Map<String, dynamic>.from(item));
            }
            return null;
          })
          .whereType<TrendingCoin>()
          .toList();
    } catch (e) {
      throw mapDioError(e);
    }
  }

  static final _feeds = <String, String>{
    'Cointelegraph': Env.rssCointelegraphUrl,
    'CoinDesk': Env.rssCoindeskUrl,
    'Decrypt': Env.rssDecryptUrl,
  };

  Future<List<NewsItem>> fetchNews() async {
    final results = await Future.wait(
      _feeds.entries.map((e) async {
        try {
          final res = await rssDio.get(e.value);
          final body = res.data is String
              ? res.data as String
              : res.data.toString();
          return _parseFeed(e.key, body);
        } catch (_) {
          return <NewsItem>[];
        }
      }),
    );

    final all = results.expand((e) => e).toList();
    // dedupe by link
    final seen = <String>{};
    final deduped = <NewsItem>[];
    for (final item in all) {
      if (seen.add(item.link)) deduped.add(item);
    }
    deduped.sort((a, b) {
      final ad = a.pubDate;
      final bd = b.pubDate;
      if (ad == null && bd == null) return 0;
      if (ad == null) return 1;
      if (bd == null) return -1;
      return bd.compareTo(ad);
    });
    if (deduped.isEmpty && results.every((r) => r.isEmpty)) {
      throw const AppFailure('Gagal memuat berita');
    }
    return deduped.take(30).toList();
  }

  List<NewsItem> _parseFeed(String source, String xmlBody) {
    final items = <NewsItem>[];
    try {
      final doc = XmlDocument.parse(xmlBody);
      for (final item in doc.findAllElements('item')) {
        String? title;
        String? link;
        String? pubDateRaw;
        String? description;
        String? thumbnail;
        for (final child in item.children.whereType<XmlElement>()) {
          final name = child.name.local;
          final text = child.innerText.trim();
          if (name == 'title') title = text;
          if (name == 'link') link = text;
          if (name == 'pubDate') pubDateRaw = text;
          if (name == 'description') description = text;
          if (name == 'enclosure') {
            thumbnail = child.getAttribute('url') ?? thumbnail;
          }
          if (name == 'content' || name == 'thumbnail') {
            // media:content / media:thumbnail
            thumbnail = child.getAttribute('url') ?? thumbnail;
          }
        }
        // media:content may be namespaced; search all descendants attributes
        for (final el in item.descendants.whereType<XmlElement>()) {
          final ln = el.name.local.toLowerCase();
          if (ln == 'content' || ln == 'thumbnail') {
            final url = el.getAttribute('url');
            if (url != null && url.isNotEmpty) thumbnail ??= url;
          }
        }
        if (title == null || link == null) continue;
        final summary = _stripHtml(description ?? '');
        items.add(
          NewsItem(
            title: title,
            link: link,
            source: source,
            pubDate: parseRfc822(pubDateRaw),
            summary: summary.isEmpty ? null : summary,
            thumbnail: thumbnail,
          ),
        );
      }
    } catch (_) {
      // ignore parse errors
    }
    return items;
  }

  static String _stripHtml(String html) {
    final noTags = html.replaceAll(RegExp(r'<[^>]*>'), ' ');
    final decoded = _decodeEntities(noTags);
    return decoded.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  static String _decodeEntities(String s) {
    return s
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'");
  }

  static DateTime? parseRfc822(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    final s = raw.trim();
    try {
      return HttpDate.parse(s);
    } catch (_) {}
    try {
      return DateFormat('EEE, dd MMM yyyy HH:mm:ss Z', 'en_US').parse(s);
    } catch (_) {}
    try {
      return DateFormat('EEE, dd MMM yyyy HH:mm:ss z', 'en_US').parse(s);
    } catch (_) {}
    return null;
  }
}
