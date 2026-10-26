import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item.freezed.dart';

@freezed
abstract class NewsItem with _$NewsItem {
  const factory NewsItem({
    required String title,
    required String link,
    required String source,
    DateTime? pubDate,
    String? summary,
    String? thumbnail,
  }) = _NewsItem;
}
