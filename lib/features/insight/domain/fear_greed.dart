import 'package:freezed_annotation/freezed_annotation.dart';

part 'fear_greed.freezed.dart';
part 'fear_greed.g.dart';

@freezed
abstract class FearGreed with _$FearGreed {
  const factory FearGreed({
    @JsonKey(name: 'data', fromJson: _valueFromData, includeToJson: false)
    required int value,
    @JsonKey(name: 'data', fromJson: _classificationFromData, includeToJson: false)
    required String classification,
    @JsonKey(name: 'data', fromJson: _timestampFromData, includeToJson: false)
    DateTime? timestamp,
    @JsonKey(name: 'data', fromJson: _historyFromData, includeToJson: false)
    @Default(<int>[]) List<int> history,
  }) = _FearGreed;

  const FearGreed._();

  String classificationId() {
    switch (classification) {
      case 'Extreme Fear':
        return 'Sangat Takut';
      case 'Fear':
        return 'Takut';
      case 'Neutral':
        return 'Netral';
      case 'Greed':
        return 'Serakah';
      case 'Extreme Greed':
        return 'Sangat Serakah';
      default:
        return classification;
    }
  }

  factory FearGreed.fromJson(Map<String, dynamic> json) =>
      _$FearGreedFromJson(json);
}

int _valueFromData(dynamic data) {
  final list = data is List ? data : const [];
  final first = list.isNotEmpty && list.first is Map
      ? Map<String, dynamic>.from(list.first as Map)
      : <String, dynamic>{};
  return int.tryParse(first['value']?.toString() ?? '0') ?? 0;
}

String _classificationFromData(dynamic data) {
  final list = data is List ? data : const [];
  final first = list.isNotEmpty && list.first is Map
      ? Map<String, dynamic>.from(list.first as Map)
      : <String, dynamic>{};
  return first['value_classification']?.toString() ?? '';
}

DateTime? _timestampFromData(dynamic data) {
  final list = data is List ? data : const [];
  final first = list.isNotEmpty && list.first is Map
      ? Map<String, dynamic>.from(list.first as Map)
      : <String, dynamic>{};
  final tsStr = first['timestamp']?.toString();
  final ts = tsStr != null ? int.tryParse(tsStr) : null;
  return ts != null ? DateTime.fromMillisecondsSinceEpoch(ts * 1000) : null;
}

List<int> _historyFromData(dynamic data) {
  final list = data is List ? data : const [];
  return list
      .whereType<Map>()
      .map((e) => int.tryParse(e['value']?.toString() ?? '0') ?? 0)
      .toList();
}
