import 'package:foxbit/shared/widgets/default_appbar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';

import 'package:foxbit/features/insight/presentation/providers/insight_providers.dart';
import 'package:foxbit/features/insight/presentation/widgets/fear_greed_card.dart';
import 'package:foxbit/features/insight/presentation/widgets/global_summary_card.dart';
import 'package:foxbit/features/insight/presentation/widgets/news_list.dart';
import 'package:foxbit/features/insight/presentation/widgets/trending_list.dart';
import 'package:foxbit/shared/widgets/error_handler.dart';

class InsightPage extends ConsumerWidget {
  const InsightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(fearGreedProvider);
    final gm = ref.watch(globalMarketProvider);
    final tr = ref.watch(trendingCoinsProvider);
    final nw = ref.watch(cryptoNewsProvider);

    Future<void> refresh() async {
      ref.invalidate(fearGreedProvider);
      ref.invalidate(globalMarketProvider);
      ref.invalidate(trendingCoinsProvider);
      ref.invalidate(cryptoNewsProvider);
      await Future.wait([
        ref.read(fearGreedProvider.future).then((_) {}, onError: (_) {}),
        ref.read(globalMarketProvider.future).then((_) {}, onError: (_) {}),
        ref.read(trendingCoinsProvider.future).then((_) {}, onError: (_) {}),
        ref.read(cryptoNewsProvider.future).then((_) {}, onError: (_) {}),
      ]);
    }

    return Scaffold(
      appBar: DefaultAppbar(title: 'Insight'),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            section(
              AppEntry(
                child: fg.when(
                  loading: () => const _LoadingCard(label: 'Fear & Greed'),
                  error: (e, _) => ErrorHandler(
                    errorText: e.toString(),
                    onPressed: () => ref.invalidate(fearGreedProvider),
                  ),
                  data: (d) => FearGreedCard(data: d),
                ),
              ),
            ),
            section(
              AppEntry(
                child: gm.when(
                  loading: () =>
                      const _LoadingCard(label: 'Ringkasan Pasar Global'),
                  error: (e, _) => ErrorHandler(
                    errorText: e.toString(),
                    onPressed: () => ref.invalidate(globalMarketProvider),
                  ),
                  data: (d) => GlobalSummaryCard(data: d),
                ),
              ),
            ),
            section(
              AppEntry(
                child: tr.when(
                  loading: () => const _LoadingCard(label: 'Trending'),
                  error: (e, _) => ErrorHandler(
                    errorText: e.toString(),
                    onPressed: () => ref.invalidate(trendingCoinsProvider),
                  ),
                  data: (d) => d.isEmpty
                      ? const _EmptyCard(label: 'Tidak ada trending')
                      : TrendingList(items: d),
                ),
              ),
            ),
            section(
              AppEntry(
                child: nw.when(
                  loading: () => const _LoadingCard(label: 'Berita'),
                  error: (e, _) => ErrorHandler(
                    errorText: e.toString(),
                    onPressed: () => ref.invalidate(cryptoNewsProvider),
                  ),
                  data: (d) => d.isEmpty
                      ? const _EmptyCard(label: 'Tidak ada berita')
                      : NewsList(items: d),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'Data: CoinGecko, Alternative.me',
                    style: TextStyle(
                      fontSize: 11,
                      color: defaultTertiaryColor(context),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
          ],
        ),
      ),
    );
  }

  static SliverPadding section(Widget child) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      sliver: SliverToBoxAdapter(child: child),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  final String label;
  const _LoadingCard({required this.label});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 12),
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  final String label;
  const _EmptyCard({required this.label});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ),
    );
  }
}
