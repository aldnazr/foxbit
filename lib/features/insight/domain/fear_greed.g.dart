// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fear_greed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FearGreed _$FearGreedFromJson(Map<String, dynamic> json) => _FearGreed(
  value: _valueFromData(json['data']),
  classification: _classificationFromData(json['data']),
  timestamp: _timestampFromData(json['data']),
  history: json['data'] == null
      ? const <int>[]
      : _historyFromData(json['data']),
);

Map<String, dynamic> _$FearGreedToJson(_FearGreed instance) =>
    <String, dynamic>{};
