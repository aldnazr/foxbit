import 'package:material_ui/material_ui.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/features/market/presentation/portfolio_hero_card.dart';
import 'package:vault_chain/features/market/presentation/crypto_tab_bar.dart';
import 'package:vault_chain/features/market/presentation/top_coin_tab_bar.dart';

class MarketTab extends StatefulWidget {
  const MarketTab({super.key});

  @override
  State<MarketTab> createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab>
    with SingleTickerProviderStateMixin {
  late final TabController _controller = TabController(length: 2, vsync: this);

  static const _tabs = ['All Coins', 'Trending Coins'];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const SliverToBoxAdapter(
          child: PortfolioHeroCard(),
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              children: [
                for (var i = 0; i < _tabs.length; i++) ...[
                  if (i > 0) const SizedBox(width: 8),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      final selected = _controller.index == i;
                      return GestureDetector(
                        onTap: () => _controller.animateTo(
                          i,
                          duration: AppDesign.base,
                          curve: AppDesign.curve,
                        ),
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
                            _tabs[i],
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
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: const [CryptoTabBar(), TopCoinTabBar()],
            ),
          ),
        ],
      ),
    );
  }
}
