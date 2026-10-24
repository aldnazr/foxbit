import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/formatter.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/features/market/application/market_controller.dart';
import 'package:vault_chain/features/portofolio/application/portofolio_controller.dart';
import 'package:vault_chain/shared/widgets/null_text.dart';
import 'package:vault_chain/shared/widgets/price_change_icon.dart';

class PortfolioHeroCard extends ConsumerWidget {
  const PortfolioHeroCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlist = ref.watch(portofolioControllerProvider).value;
    final markets = ref.watch(marketControllerProvider).value?.markets;

    final hairline = Theme.of(context).colorScheme.outline;
    final accent = appAccentColor(context);

    final prices = <double, double>{};
    final changes = <double, num>{};
    final series = <List<num>>[];
    if (watchlist != null && markets != null) {
      for (final coin in markets) {
        final id = coin.id;
        if (id == null || coin.currentPrice == null) continue;
        if (watchlist.any((e) => e.id == id)) {
          final key = coin.currentPrice!.toDouble();
          prices[key] = key;
          if (coin.priceChangePercentage24h != null) {
            changes[key] = coin.priceChangePercentage24h!;
          }
          final spark = coin.sparklineIn7d?.price;
          if (spark != null) series.add(spark);
        }
      }
    }

    final value = prices.keys.fold<double>(0, (sum, p) => sum + p);
    final prevValue = changes.entries.fold<double>(
      0,
      (sum, e) => sum + e.key / (1 + e.value / 100),
    );
    final change = prevValue > 0
        ? ((value - prevValue) / prevValue) * 100
        : null;

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 4, 20, 0),
      padding: const EdgeInsets.fromLTRB(20, 18, 16, 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppDesign.r24),
        border: Border.all(color: hairline),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'TOTAL PORTFOLIO',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        color: defaultTertiaryColor(context),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.visibility_outlined,
                      size: 14,
                      color: defaultTertiaryColor(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  Formatter.formatCurrency(value),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1,
                    color: defaultTitleColor(context),
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
                const SizedBox(height: 10),
                change == null
                    ? const NullText()
                    : PriceChangeIcon(
                        change > 0,
                        label: Formatter.formatPercent(change),
                      ),
              ],
            ),
          ),
          if (series.length > 1)
            Expanded(
              flex: 4,
              child: _AggregatedSparkline(series: series, accent: accent),
            ),
        ],
      ),
    );
  }
}

class _AggregatedSparkline extends StatelessWidget {
  final List<List<num>> series;
  final Color accent;

  const _AggregatedSparkline({required this.series, required this.accent});

  @override
  Widget build(BuildContext context) {
    final minLength = series.fold<int>(
      series.first.length,
      (min, s) => s.length < min ? s.length : min,
    );
    final points = List.generate(
      minLength,
      (i) => series.fold<double>(0, (sum, s) => sum + s[i].toDouble()),
    );
    const stride = 4;
    final spots = <FlSpot>[
      for (var i = 0; i < points.length; i += stride)
        FlSpot((i ~/ stride).toDouble(), points[i]),
    ];

    return SizedBox(
      height: 72,
      child: LineChart(
        LineChartData(
          minX: spots.first.x,
          maxX: spots.last.x,
          lineTouchData: const LineTouchData(enabled: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 2,
              color: accent,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [accent.withValues(alpha: 0.25), Colors.transparent],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
