import 'package:fl_chart/fl_chart.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/core/utils/formatter.dart';
import 'package:foxbit/features/market/application/market_controller.dart';
import 'package:foxbit/shared/models/coin_detail_args.dart';
import 'package:foxbit/shared/widgets/error_handler.dart';
import 'package:foxbit/shared/widgets/null_text.dart';
import 'package:foxbit/shared/widgets/price_change_icon.dart';
import 'package:foxbit/core/utils/util.dart';

class CryptoTabBar extends ConsumerWidget {
  const CryptoTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketAsync = ref.watch(marketControllerProvider);

    return marketAsync.when(
      loading: () => Skeletonizer.sliver(
        child: SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(
                        width: 18,
                        child: Bone.text(words: 1),
                      ),
                      SizedBox(width: 10),
                      Bone.circle(size: 40),
                    ],
                  ),
                  title: const Bone.text(words: 2),
                  subtitle: const Bone.text(words: 1),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
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
                      const SizedBox(width: 14),
                      const Bone(
                        width: 56,
                        height: 28,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
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
          onPressed: () => ref.read(marketControllerProvider.notifier).refresh(),
        ),
      ),
      data: (state) {
        final markets = state.markets;
        if (markets.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text("No data found")),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: SliverList.builder(
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
              final spark = coin.sparklineIn7d?.price;
              return Column(
                children: [
                  ListTile(
                    key: ValueKey(coin.id),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 18,
                          child: Text(
                            '${coin.marketCapRank ?? '-'}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: defaultTertiaryColor(context),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          radius: 20,
                          foregroundImage: coin.image != null
                              ? NetworkImage(
                                  coin.image!.replaceAll(
                                    '/large/',
                                    '/small_2x/',
                                  ),
                                )
                              : null,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                    title: Text(
                      coin.name ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      (coin.symbol ?? '').toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall
                          ?.copyWith(fontSize: 12, letterSpacing: 0.5),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            coin.currentPrice == null
                                ? const NullText()
                                : Text(
                                    Formatter.formatCurrency(
                                      coin.currentPrice!,
                                    ),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w700,
                                      color: defaultTitleColor(context),
                                      fontFeatures: const [
                                        FontFeature.tabularFigures(),
                                      ],
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
                        if (spark != null && spark.length > 2) ...[
                          const SizedBox(width: 14),
                          _MicroSparkline(
                            prices: spark,
                            isUp: (coin.priceChangePercentage24h ?? 0) > 0,
                          ),
                        ],
                      ],
                    ),
                  ),
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

class _MicroSparkline extends StatelessWidget {
  final List<num> prices;
  final bool isUp;

  const _MicroSparkline({required this.prices, required this.isUp});

  @override
  Widget build(BuildContext context) {
    const stride = 6;
    final count = (prices.length / stride).ceil();
    final spots = <FlSpot>[
      for (var i = 0; i < prices.length; i += stride)
        FlSpot((i ~/ stride).toDouble(), prices[i].toDouble()),
      if ((prices.length - 1) % stride != 0)
        FlSpot((count - 1).toDouble(), prices.last.toDouble()),
    ];
    final color = isUp ? positiveColor(context) : negativeColor(context);
    var minX = spots.first.x;
    final maxX = spots.last.x;
    var minY = spots.first.y;
    var maxY = spots.first.y;
    for (final s in spots) {
      minY = s.y < minY ? s.y : minY;
      maxY = s.y > maxY ? s.y : maxY;
    }
    final pad = maxY > minY ? (maxY - minY) * 0.12 : (maxY.abs() * 0.12 + 1);

    return SizedBox(
      width: 56,
      height: 28,
      child: LineChart(
        LineChartData(
          minX: minX,
          maxX: maxX,
          minY: minY - pad,
          maxY: maxY + pad,
          lineTouchData: const LineTouchData(enabled: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 1.5,
              color: color,
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
