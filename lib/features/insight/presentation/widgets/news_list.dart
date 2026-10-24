import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/features/insight/domain/news_item.dart';

class NewsList extends StatelessWidget {
  final List<NewsItem> items;
  const NewsList({super.key, required this.items});

  String _relative(DateTime? dt) {
    if (dt == null) return '';
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'Baru saja';
    if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
    if (diff.inHours < 24) return '${diff.inHours} jam lalu';
    if (diff.inDays < 7) return '${diff.inDays} hari lalu';
    return '${dt.day}/${dt.month}/${dt.year}';
  }

  Future<void> _open(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Tidak ada berita'),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BERITA',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: defaultTertiaryColor(context),
              ),
            ),
            const SizedBox(height: 8),
            ...items.map((n) {
              return InkWell(
                onTap: () => _open(n.link),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        n.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            n.source,
                            style: TextStyle(
                              fontSize: 12,
                              color: defaultTertiaryColor(context),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _relative(n.pubDate),
                            style: TextStyle(
                              fontSize: 12,
                              color: defaultTertiaryColor(context),
                            ),
                          ),
                        ],
                      ),
                      if (n.summary != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          n.summary!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
