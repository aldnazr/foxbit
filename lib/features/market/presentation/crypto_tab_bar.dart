import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/core/utils/formatter.dart';
import 'package:vault_chain/features/market/application/market_controller.dart';
import 'package:vault_chain/shared/models/coin_detail_args.dart';
import 'package:vault_chain/shared/widgets/coin_tile_skeleton.dart';
import 'package:vault_chain/shared/widgets/error_handler.dart';
import 'package:vault_chain/shared/widgets/null_text.dart';
import 'package:vault_chain/shared/widgets/price_change_icon.dart';

class CryptoTabBar extends ConsumerWidget {
  const CryptoTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketAsync = ref.watch(marketControllerProvider);

    return marketAsync.when(
      loading: () => const CoinTileSkeleton(),
      error: (err, st) => ErrorHandler(
        errorText: "Error: $err",
        onPressed: () => ref.read(marketControllerProvider.notifier).refresh(),
      ),
      data: (state) {
        final markets = state.markets;
        if (markets.isEmpty) {
          return const Center(child: Text("No data found"));
        }

        return RefreshIndicator(
          onRefresh: () =>
              ref.read(marketControllerProvider.notifier).refresh(),
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (!state.isLoadingMore &&
                  scrollInfo.metrics.pixels >=
                      scrollInfo.metrics.maxScrollExtent * 0.9) {
                ref.read(marketControllerProvider.notifier).fetchNextPage();
              }
              return false;
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: markets.length + (state.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == markets.length) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final coin = markets[index];
                return Column(
                  children: [
                    ListTile(
                      key: ValueKey(coin.id),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      onTap: () {
                        if (coin.id == null) return;
                        context.push(
                          '/coin/${coin.id}',
                          extra: CoinDetailArgs(
                            id: coin.id!,
                            name: coin.name,
                            symbol: coin.symbol,
                            image: coin.image,
                            marketCapRank: coin.marketCapRank?.toInt(),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 22,
                        foregroundImage: coin.image != null
                            ? NetworkImage(
                                coin.image!.replaceAll('/large/', '/small_2x/'),
                              )
                            : null,
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                        coin.name ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        (coin.symbol ?? '').toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                              letterSpacing: 0.5,
                            ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          coin.currentPrice == null
                              ? const NullText()
                              : Text(
                                  Formatter.formatCurrency(coin.currentPrice!),
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                          coin.priceChangePercentage24h == null
                              ? const NullText()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: PriceChangeIcon(
                                    coin.priceChangePercentage24h! > 0,
                                    label: Formatter.formatPercent(
                                      coin.priceChangePercentage24h!,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    const Divider(height: 0, thickness: 1, indent: 72),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
