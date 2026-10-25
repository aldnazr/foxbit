import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/core/utils/formatter.dart';
import 'package:foxbit/features/market/application/market_controller.dart';
import 'package:foxbit/shared/models/coin_detail_args.dart';
import 'package:foxbit/shared/widgets/error_handler.dart';
import 'package:foxbit/shared/widgets/price_change_icon.dart';

class TopCoinTabBar extends ConsumerWidget {
  const TopCoinTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topCoinsAsync = ref.watch(topCoinsControllerProvider);

    return topCoinsAsync.when(
      loading: () => Skeletonizer.sliver(
        child: SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  key: ValueKey(index),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  leading: const Bone.circle(size: 44),
                  title: const Bone.text(words: 2),
                  subtitle: const Bone.text(words: 1),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Bone.text(words: 1),
                      SizedBox(height: 4),
                      Bone(
                        width: 50,
                        height: 12,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
                if (index < 9)
                  const Divider(height: 0, thickness: 1, indent: 72),
              ],
            ),
          ),
        ),
      ),
      error: (err, st) => SliverFillRemaining(
        hasScrollBody: false,
        child: ErrorHandler(
          errorText: "Error: $err",
          onPressed: () =>
              ref.read(topCoinsControllerProvider.notifier).refresh(),
        ),
      ),
      data: (topCoinModel) {
        final topCoins = topCoinModel.coins;
        if (topCoins.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text("No data found")),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverList.builder(
            itemCount: topCoins.length,
            itemBuilder: (context, index) {
              final coin = topCoins[index].item;
              final priceChange =
                  coin.data.priceChangePercentage24h['usd'] ?? 0.0;

              return Column(
                children: [
                  ListTile(
                    key: ValueKey(coin.id),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    onTap: () {
                      context.push(
                        '/coin/${coin.id}',
                        extra: CoinDetailArgs(
                          id: coin.id,
                          name: coin.name,
                          symbol: coin.symbol,
                          image: coin.large,
                          marketCapRank: coin.marketCapRank,
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 22,
                      foregroundImage: NetworkImage(coin.small),
                      backgroundColor: Colors.transparent,
                    ),
                    title: Text(
                      coin.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      coin.symbol.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(fontSize: 12, letterSpacing: 0.5),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          Formatter.formatCurrency(coin.data.price),
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: PriceChangeIcon(
                            priceChange > 0,
                            label: Formatter.formatPercent(priceChange),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index < topCoins.length - 1)
                    const Divider(height: 0, thickness: 1, indent: 72),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
