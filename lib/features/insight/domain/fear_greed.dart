class FearGreed {
  final int value;
  final String classification;
  final DateTime? timestamp;
  final List<int>
  history; // last 30 values (newest first? we'll store as given)

  const FearGreed({
    required this.value,
    required this.classification,
    this.timestamp,
    this.history = const [],
  });

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

  static FearGreed fromJson(Map<String, dynamic> json) {
    final data = (json['data'] as List?) ?? const [];
    final first = data.isNotEmpty && data.first is Map
        ? Map<String, dynamic>.from(data.first as Map)
        : <String, dynamic>{};
    final valueStr = first['value']?.toString() ?? '0';
    final value = int.tryParse(valueStr) ?? 0;
    final classification = first['value_classification']?.toString() ?? '';
    final tsStr = first['timestamp']?.toString();
    final ts = tsStr != null ? int.tryParse(tsStr) : null;
    final timestamp = ts != null
        ? DateTime.fromMillisecondsSinceEpoch(ts * 1000)
        : null;
    final history = data
        .whereType<Map>()
        .map((e) => int.tryParse(e['value']?.toString() ?? '0') ?? 0)
        .toList();
    return FearGreed(
      value: value,
      classification: classification,
      timestamp: timestamp,
      history: history,
    );
  }
}
