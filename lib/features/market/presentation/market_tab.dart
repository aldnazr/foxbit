import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:foxbit/features/market/application/market_controller.dart';
import 'package:material_ui/material_ui.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/market/presentation/portfolio_hero_card.dart';
import 'package:foxbit/features/market/presentation/crypto_tab_bar.dart';
import 'package:foxbit/features/market/presentation/top_coin_tab_bar.dart';
import 'package:foxbit/shared/widgets/home_appbar.dart';

class MarketTab extends ConsumerStatefulWidget {
  const MarketTab({super.key});

  @override
  ConsumerState<MarketTab> createState() => _MarketTabState();
}

class _MarketTabState extends ConsumerState<MarketTab> {
  static const _tabs = ['All Coins', 'Trending Coins'];

  int _index = 0;

  Future<void> _onRefresh() async {
    if (_index == 0) {
      await ref.read(marketControllerProvider.notifier).refresh();
    } else {
      await ref.read(topCoinsControllerProvider.notifier).refresh();
    }
  }

  // Pagination pindah ke sini (sebelumnya di CryptoTabBar)
  bool _onScroll(ScrollNotification n) {
    if (_index != 0 || n.depth != 0) return false;

    final state = ref.read(marketControllerProvider).value;
    if (state == null || state.isLoadingMore) return false;

    if (n.metrics.pixels >= n.metrics.maxScrollExtent * 0.9) {
      ref.read(marketControllerProvider.notifier).fetchNextPage();
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final marketAsync = ref.watch(marketControllerProvider);
    final topCoinsAsync = ref.watch(topCoinsControllerProvider);

    final isLoadingPills = marketAsync.isLoading || topCoinsAsync.isLoading;

    return Scaffold(
      appBar: HomeAppbar(),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: NotificationListener<ScrollNotification>(
          onNotification: _onScroll,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: PortfolioHeroCard()),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabPillsDelegate(
                  tabs: _tabs,
                  selectedIndex: _index,
                  onSelect: (i) => setState(() => _index = i),
                  isLoading: isLoadingPills,
                ),
              ),
              if (_index == 0) const CryptoTabBar() else const TopCoinTabBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabPillsDelegate extends SliverPersistentHeaderDelegate {
  _TabPillsDelegate({
    required this.tabs,
    required this.selectedIndex,
    required this.onSelect,
    required this.isLoading,
  });

  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final bool isLoading;

  static const _height = 72.0;

  @override
  double get minExtent => _height;

  @override
  double get maxExtent => _height;

  @override
  bool shouldRebuild(covariant _TabPillsDelegate old) =>
      old.selectedIndex != selectedIndex ||
      old.tabs != tabs ||
      old.isLoading != isLoading;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Skeletonizer(
        enabled: isLoading,
        child: Row(
          children: [
            for (var i = 0; i < tabs.length; i++) ...[
              if (i > 0) const SizedBox(width: 8),
              Builder(
                builder: (context) {
                  final selected = selectedIndex == i;
                  return GestureDetector(
                    onTap: () => onSelect(i),
                    child: AnimatedContainer(
                      duration: AppDesign.base,
                      curve: AppDesign.curve,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? appAccentColor(context).withValues(alpha: 0.12)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppDesign.full),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      child: Text(
                        tabs[i],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: selected
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: selected
                              ? appAccentColor(context)
                              : defaultSecondaryColor(context),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
