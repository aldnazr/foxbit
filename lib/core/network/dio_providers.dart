import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vault_chain/core/config/env.dart';

part 'dio_providers.g.dart';

Dio _baseDio({
  required String baseUrl,
  Map<String, String>? headers,
  bool plain = false,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: headers,
      responseType: plain ? ResponseType.plain : ResponseType.json,
    ),
  );
  if (kDebugMode) {
    dio.interceptors.add(
      LogInterceptor(requestBody: false, responseBody: false),
    );
  }
  return dio;
}

@Riverpod(keepAlive: true)
Dio coingeckoDio(Ref ref) {
  final headers = <String, String>{};
  if (Env.coingeckoDemoKey.isNotEmpty) {
    headers['x-cg-demo-api-key'] = Env.coingeckoDemoKey;
  }
  return _baseDio(
    baseUrl: 'https://api.coingecko.com/api/v3',
    headers: headers,
  );
}

@Riverpod(keepAlive: true)
Dio alternativeDio(Ref ref) {
  return _baseDio(baseUrl: 'https://api.alternative.me');
}

@Riverpod(keepAlive: true)
Dio rssDio(Ref ref) {
  return _baseDio(
    baseUrl: '',
    plain: true,
    headers: {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      'Accept': 'application/rss+xml, application/xml, text/xml',
    },
  );
}

@Riverpod(keepAlive: true)
Dio mempoolDio(Ref ref) {
  return _baseDio(baseUrl: 'https://mempool.space/api');
}

@Riverpod(keepAlive: true)
Dio etherscanDio(Ref ref) {
  return _baseDio(baseUrl: 'https://api.etherscan.io/v2/api');
}
