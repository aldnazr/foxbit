import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/insight/domain/news_item.dart';

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

  Future<void> _open(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      _showFailed(context);
      return;
    }
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!opened && context.mounted) _showFailed(context);
    } catch (_) {
      if (context.mounted) _showFailed(context);
    }
  }

  void _showFailed(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Tautan tidak bisa dibuka')));
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Text('Belum ada berita. Tarik ke bawah untuk memuat ulang.'),
      );
    }

    final secondary = defaultSecondaryColor(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'BERITA',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: secondary,
              ),
            ),
            const Spacer(),
            Text(
              '${items.length} berita',
              style: TextStyle(fontSize: 12, color: secondary),
            ),
          ],
        ),
        const SizedBox(height: AppDesign.s12),
        const Divider(),
        for (final item in items) ...[
          const Divider(),
          _compactTile(context, item),
        ],
      ],
    );
  }

  Widget _compactTile(BuildContext context, NewsItem item) {
    final secondary = defaultSecondaryColor(context);
    return InkWell(
      onTap: () => _open(context, item.link),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDesign.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                height: 1.35,
                fontWeight: FontWeight.w600,
                color: defaultTitleColor(context),
              ),
            ),
            if (item.summary != null) ...[
              const SizedBox(height: AppDesign.s4),
              Text(
                item.summary!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13, height: 1.45, color: secondary),
              ),
            ],
            const SizedBox(height: AppDesign.s8),
            _meta(context, item),
          ],
        ),
      ),
    );
  }

  Widget _meta(BuildContext context, NewsItem item) {
    final style = TextStyle(
      fontSize: 12,
      color: defaultSecondaryColor(context),
    );
    final time = _relative(item.pubDate);
    return Row(
      children: [
        Flexible(
          child: Text(
            item.source,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        if (time.isNotEmpty) ...[
          const SizedBox(width: AppDesign.s8),
          Text('·', style: style),
          const SizedBox(width: AppDesign.s8),
          Text(time, style: style),
        ],
      ],
    );
  }
}
