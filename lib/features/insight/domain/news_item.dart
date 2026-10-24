class NewsItem {
  final String title;
  final String link;
  final String source;
  final DateTime? pubDate;
  final String? summary;
  final String? thumbnail;

  const NewsItem({
    required this.title,
    required this.link,
    required this.source,
    this.pubDate,
    this.summary,
    this.thumbnail,
  });
}
