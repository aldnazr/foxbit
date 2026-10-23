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
              padding: const EdgeInsets.only(top: 3),
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
                      minTileHeight: 0,
                      contentPadding: const EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                        left: 18.0,
                        right: 16.0,
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
                        radius: 18,
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
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text((coin.symbol ?? '').toUpperCase()),
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
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    PriceChangeIcon(
                                      coin.priceChangePercentage24h! <= 0,
                                    ),
                                    Text(
                                      Formatter.formatPercent(
                                        coin.priceChangePercentage24h!,
                                      ),
                                      style: TextStyle(
                                        fontSize: 13,
                                        color:
                                            coin.priceChangePercentage24h! < 0
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    const Divider(height: 0, thickness: 1),
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
