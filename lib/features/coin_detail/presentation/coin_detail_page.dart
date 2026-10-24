import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/formatter.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/features/coin_detail/application/coin_detail_controller.dart';
import 'package:vault_chain/features/coin_detail/widgets/coin_detail_skeleton.dart';
import 'package:vault_chain/features/portofolio/application/portofolio_controller.dart';
import 'package:vault_chain/shared/models/coin_detail.dart';
import 'package:vault_chain/shared/models/coin_detail_args.dart';
import 'package:vault_chain/shared/models/portofolio_model.dart';
import 'package:vault_chain/shared/widgets/error_handler.dart';
import 'package:vault_chain/shared/widgets/null_text.dart';
import 'package:vault_chain/shared/widgets/price_change_icon.dart';

class CoinDetailPage extends ConsumerStatefulWidget {
  final String id;
  final CoinDetailArgs? args;

  const CoinDetailPage({super.key, required this.id, this.args});

  @override
  ConsumerState<CoinDetailPage> createState() => _CoinDetailPageState();
}

class _CoinDetailPageState extends ConsumerState<CoinDetailPage> {
  final _textCoinController = TextEditingController();
  final _textCurrencyController = TextEditingController();
  bool _isInitializedConverter = false;

  static const _ranges = ['1D', '1W', '1M', '1Y', 'All'];

  @override
  void dispose() {
    _textCoinController.dispose();
    _textCurrencyController.dispose();
    super.dispose();
  }

  void _initConverters(CoinDetail detail) {
    if (_isInitializedConverter) return;
    _isInitializedConverter = true;
    _textCoinController.text = "1.0";
    final marketPriceRaw = detail.marketData.currentPrice['idr'];
    final marketPrice = (marketPriceRaw is num)
        ? marketPriceRaw.toDouble()
        : double.tryParse(marketPriceRaw.toString()) ?? 0.0;
    _textCurrencyController.text = marketPrice.toString();
  }

  void _cryptoConverter(String value, CoinDetail detail) {
    final price = double.tryParse(value) ?? 0.0;
    final marketPriceRaw = detail.marketData.currentPrice['idr'];
    final marketPrice = (marketPriceRaw is num)
        ? marketPriceRaw.toDouble()
        : double.tryParse(marketPriceRaw.toString()) ?? 0.0;
    final total = marketPrice > 0 ? price / marketPrice : 0.0;
    _textCoinController.text = total.toString();
  }

  void _currencyConverter(String value, CoinDetail detail) {
    final coins = double.tryParse(value) ?? 0.0;
    final marketPriceRaw = detail.marketData.currentPrice['idr'];
    final marketPrice = (marketPriceRaw is num)
        ? marketPriceRaw.toDouble()
        : double.tryParse(marketPriceRaw.toString()) ?? 0.0;
    final total = coins * marketPrice;
    _textCurrencyController.text = total.toString();
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args;
    final id = widget.id;
    final isFav = ref.watch(isFavoriteProvider(id));
    final detailAsync = ref.watch(coinDetailControllerProvider(id));

    final displayName = args?.name ?? id;
    final displaySymbol = args?.symbol ?? id;
    final displayImage = args?.image ?? '';
    final displayRank = args?.marketCapRank;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (displayImage.isNotEmpty)
              CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(
                  displayImage.replaceAll('/large/', '/small/'),
                ),
                backgroundColor: Colors.transparent,
              ),
            const SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      displaySymbol.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    if (displayRank != null)
                      Card.filled(
                        color: defaultPrimaryContainer(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDesign.r8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            '#$displayRank',
                            style: TextStyle(
                              fontSize: 11,
                              color: defaultOnPrimaryContainer(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    displayName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: defaultOnPrimaryContainer(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(portofolioControllerProvider.notifier)
                  .toggleFavorite(
                    PortofolioModel(
                      id: id,
                      name: displayName,
                      symbol: displaySymbol,
                      image: displayImage,
                      marketCapRank: displayRank ?? 0,
                    ),
                  );
            },
            isSelected: isFav,
            icon: const Icon(Icons.star_border_outlined),
            selectedIcon: Icon(Icons.star, color: appAccentColor(context)),
          ),
        ],
      ),
      body: detailAsync.when(
        loading: () => const CoinDetailSkeleton(),
        error: (err, st) => ErrorHandler(
          errorText: 'Error: $err',
          onPressed: () =>
              ref.read(coinDetailControllerProvider(id).notifier).refresh(),
        ),
        data: (state) {
          final detail = state.detail;
          final ohlc = state.ohlc;

          if (detail == null || ohlc == null) {
            return const CoinDetailSkeleton();
          }

          _initConverters(detail);

          final hairline = Theme.of(context).colorScheme.outline;
          final positive = positiveColor(context);
          final negative = negativeColor(context);
          final accent = appAccentColor(context);
          final change24h = detail.marketData.changes['24h'];
          final range = state.range;
          // final symbol = displaySymbol.toUpperCase();

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(coinDetailControllerProvider(id).notifier).refresh(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        if (detail.marketData.currentPrice['idr'] != null)
                          Text(
                            Formatter.formatCurrency(
                              detail.marketData.currentPrice['idr']!,
                            ),
                            style: TextStyle(
                              fontFamily: 'SFPro',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1,
                              color: defaultTitleColor(context),
                              fontFeatures: const [
                                FontFeature.tabularFigures(),
                              ],
                            ),
                          ),
                        const SizedBox(width: 8),
                        change24h == null
                            ? const NullText()
                            : Row(
                                children: [
                                  PriceChangeIcon(
                                    change24h > 0,
                                    label: Formatter.formatPercent(change24h),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '(24H)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: defaultTertiaryColor(context),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _RangeChips(
                    ranges: _ranges,
                    selected: range,
                    onSelected: (r) => ref
                        .read(coinDetailControllerProvider(id).notifier)
                        .setRange(r),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 160,
                    child: AnimatedOpacity(
                      duration: AppDesign.base,
                      opacity: state.isRangeLoading ? 0.4 : 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: CandlestickChart(
                          CandlestickChartData(
                            borderData: FlBorderData(show: false),
                            candlestickSpots: ohlc.asMap().entries.map((entry) {
                              final index = entry.key;
                              final data = entry.value;
                              return CandlestickSpot(
                                x: index.toDouble(),
                                open: data.open,
                                high: data.high,
                                low: data.low,
                                close: data.close,
                                show: true,
                              );
                            }).toList(),
                            minX: 0,
                            maxX: ohlc.length.toDouble(),
                            gridData: FlGridData(
                              show: true,
                              getDrawingVerticalLine: (_) =>
                                  const FlLine(strokeWidth: 0),
                              getDrawingHorizontalLine: (_) =>
                                  FlLine(color: hairline, strokeWidth: 0.8),
                            ),
                            titlesData: FlTitlesData(
                              show: true,
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                drawBelowEverything: true,
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  maxIncluded: false,
                                  minIncluded: false,
                                  reservedSize: 40,
                                  getTitlesWidget: _leftTitles,
                                ),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 36,
                                  maxIncluded: false,
                                  interval: 1,
                                  getTitlesWidget: _bottomTitles,
                                ),
                              ),
                            ),
                            touchedPointIndicator: AxisSpotIndicator(
                              painter: AxisLinesIndicatorPainter(
                                verticalLineProvider: (x) {
                                  final index = x.toInt();
                                  if (index < 0 || index >= ohlc.length) {
                                    return VerticalLine(x: x, strokeWidth: 0);
                                  }
                                  final data = ohlc[index];
                                  return VerticalLine(
                                    x: x,
                                    color:
                                        (data.open < data.close
                                                ? negative
                                                : positive)
                                            .withValues(alpha: 0.5),
                                    strokeWidth: 1,
                                  );
                                },
                                horizontalLineProvider: (y) => HorizontalLine(
                                  y: y,
                                  label: HorizontalLineLabel(
                                    show: true,
                                    style: TextStyle(
                                      color: accent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    labelResolver: (hLine) =>
                                        hLine.y.toInt().toString(),
                                    alignment: Alignment.topLeft,
                                  ),
                                  color: accent.withValues(alpha: 0.8),
                                  strokeWidth: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card.outlined(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 14.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: detail.marketData.changes.entries.map((e) {
                          return Expanded(
                            child: Column(
                              children: [
                                Text(
                                  e.key,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  width: double.infinity,
                                  child: Divider(thickness: 1.5),
                                ),
                                e.value == null
                                    ? const NullText()
                                    : Text(
                                        Formatter.formatPercent(e.value!),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: e.value! >= 0
                                              ? positive
                                              : negative,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _textCoinController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 14, height: 1.8),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: CircleAvatar(
                                radius: 1,
                                foregroundImage: NetworkImage(
                                  detail.image.small,
                                ),
                                foregroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            _currencyConverter(value, detail);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _textCurrencyController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 14, height: 1.8),
                          decoration: const InputDecoration(
                            prefixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'IDR',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          onChanged: (value) {
                            _cryptoConverter(value, detail);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RangeChips extends StatelessWidget {
  final List<String> ranges;
  final String selected;
  final ValueChanged<String> onSelected;

  const _RangeChips({
    required this.ranges,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final outline = Theme.of(context).colorScheme.outline;
    final accent = appAccentColor(context);

    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          for (var i = 0; i < ranges.length; i++) ...[
            if (i > 0) const SizedBox(width: 10),
            GestureDetector(
              onTap: () => onSelected(ranges[i]),
              child: AnimatedContainer(
                duration: AppDesign.base,
                curve: AppDesign.curve,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected == ranges[i]
                      ? accent.withValues(alpha: 0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDesign.full),
                  border: Border.all(
                    color: selected == ranges[i] ? accent : outline,
                  ),
                ),
                child: Text(
                  ranges[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: selected == ranges[i]
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: selected == ranges[i]
                        ? accent
                        : defaultSecondaryColor(context),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

Widget _bottomTitles(double value, TitleMeta meta) {
  final day = value.toInt() + 1;
  final isImportantToShow = day % 5 == 0 || day == 1;

  if (!isImportantToShow) {
    return const SizedBox();
  }

  return SideTitleWidget(
    meta: meta,
    child: Text(
      day.toString(),
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _leftTitles(double value, TitleMeta meta) {
  return SideTitleWidget(
    meta: meta,
    child: Text(
      meta.formattedValue,
      style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
    ),
  );
}
