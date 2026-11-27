import 'package:foxbit/shared/widgets/default_appbar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/insight/presentation/providers/insight_providers.dart';
import 'package:foxbit/features/insight/presentation/widgets/fear_greed_card.dart';
import 'package:foxbit/features/insight/presentation/widgets/global_summary_card.dart';
import 'package:foxbit/features/insight/presentation/widgets/news_list.dart';
import 'package:foxbit/shared/widgets/error_handler.dart';

class InsightPage extends ConsumerWidget {
  const InsightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(fearGreedProvider);
    final gm = ref.watch(globalMarketProvider);
    final nw = ref.watch(cryptoNewsProvider);
    final bottomSpacer = MediaQuery.viewPaddingOf(context).bottom + 88;

    Future<void> refresh() async {
      ref.invalidate(fearGreedProvider);
      ref.invalidate(globalMarketProvider);
      ref.invalidate(cryptoNewsProvider);
      await Future.wait([
        ref.read(fearGreedProvider.future).then((_) {}, onError: (_) {}),
        ref.read(globalMarketProvider.future).then((_) {}, onError: (_) {}),
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
                  loading: () => const _FearGreedSkeleton(),
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
                  loading: () => const _GlobalMarketSkeleton(),
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
                child: nw.when(
                  loading: () => const _NewsSkeleton(),
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
            SliverToBoxAdapter(child: SizedBox(height: bottomSpacer)),
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

class _SkeletonZone extends StatelessWidget {
  final String label;
  final Widget child;
  const _SkeletonZone({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    return Semantics(
      container: true,
      label: label,
      child: Skeletonizer.zone(
        effect: reduceMotion
            ? SolidColorEffect(
                color: AppDesign.surfaceAlt(Theme.of(context).brightness),
              )
            : null,
        child: child,
      ),
    );
  }
}

class _FearGreedSkeleton extends StatelessWidget {
  const _FearGreedSkeleton();

  @override
  Widget build(BuildContext context) {
    return _SkeletonZone(
      label: 'Memuat indeks Fear & Greed',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Bone.text(words: 2, fontSize: 11),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Bone(width: 64, height: 44, uniRadius: 10),
                  SizedBox(width: 12),
                  Bone(width: 96, height: 15, uniRadius: 6),
                ],
              ),
              SizedBox(height: 12),
              Bone(width: double.infinity, height: 40, uniRadius: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlobalMarketSkeleton extends StatelessWidget {
  const _GlobalMarketSkeleton();

  @override
  Widget build(BuildContext context) {
    return _SkeletonZone(
      label: 'Memuat ringkasan pasar global',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Bone.text(words: 2, fontSize: 11),
              const SizedBox(height: 12),
              for (var i = 0; i < 4; i++) ...[
                if (i > 0) const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bone.text(words: 2, fontSize: 14),
                    Bone.text(words: 2, fontSize: 14),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsSkeleton extends StatelessWidget {
  const _NewsSkeleton();

  @override
  Widget build(BuildContext context) {
    return _SkeletonZone(
      label: 'Memuat berita',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Bone.text(words: 1, fontSize: 11),
              Spacer(),
              Bone.text(words: 1, fontSize: 12),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          _lead(),
          for (var i = 0; i < 3; i++) ...[const Divider(), _row()],
        ],
      ),
    );
  }

  Widget _lead() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Bone.text(words: 1, fontSize: 12),
              SizedBox(width: 8),
              Bone.text(words: 1, fontSize: 12),
            ],
          ),
          SizedBox(height: 8),
          Bone.multiText(lines: 3, fontSize: 18),
          SizedBox(height: 8),
          Bone.multiText(lines: 2, fontSize: 13),
        ],
      ),
    );
  }

  Widget _row() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bone.multiText(lines: 2, fontSize: 14),
          SizedBox(height: 4),
          Bone.multiText(lines: 2, fontSize: 13),
          SizedBox(height: 8),
          Row(
            children: [
              Bone.text(words: 1, fontSize: 12),
              SizedBox(width: 8),
              Bone.text(words: 1, fontSize: 12),
            ],
          ),
        ],
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
