import 'package:foxbit/shared/widgets/default_appbar.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/formatter.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/coin_detail/application/coin_detail_controller.dart';
import 'package:foxbit/features/coin_detail/widgets/chart_formatters.dart';
import 'package:foxbit/features/coin_detail/widgets/coin_detail_skeleton.dart';
import 'package:foxbit/features/coin_detail/widgets/price_chart.dart';
import 'package:foxbit/features/portofolio/application/portofolio_controller.dart';
import 'package:foxbit/features/settings/application/currency_controller.dart';
import 'package:foxbit/shared/models/chart_point.dart';
import 'package:foxbit/shared/models/coin_detail.dart';
import 'package:foxbit/shared/models/coin_detail_args.dart';
import 'package:foxbit/shared/models/portofolio_model.dart';
import 'package:foxbit/shared/widgets/error_handler.dart';
import 'package:foxbit/shared/widgets/null_text.dart';
import 'package:foxbit/shared/widgets/outlined_text_field.dart';
import 'package:foxbit/shared/widgets/price_change_icon.dart';

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
  final _scrub = ValueNotifier<ChartPoint?>(null);
  DisplayCurrency? _converterCurrency;

  static const _ranges = ['1D', '1W', '1M', '1Y', 'All'];

  @override
  void dispose() {
    _textCoinController.dispose();
    _textCurrencyController.dispose();
    _scrub.dispose();
    super.dispose();
  }

  double _marketPrice(CoinDetail detail, DisplayCurrency currency) {
    final marketPriceRaw = detail.marketData.currentPrice[currency.name];
    return (marketPriceRaw is num)
        ? marketPriceRaw.toDouble()
        : double.tryParse(marketPriceRaw.toString()) ?? 0.0;
  }

  void _initConverters(CoinDetail detail, DisplayCurrency currency) {
    if (_converterCurrency == currency) return;
    _converterCurrency = currency;
    _textCoinController.text = "1.0";
    _textCurrencyController.text = _marketPrice(detail, currency).toString();
  }

  void _cryptoConverter(
    String value,
    CoinDetail detail,
    DisplayCurrency currency,
  ) {
    final price = double.tryParse(value) ?? 0.0;
    final marketPrice = _marketPrice(detail, currency);
    final total = marketPrice > 0 ? price / marketPrice : 0.0;
    _textCoinController.text = total.toString();
  }

  void _currencyConverter(
    String value,
    CoinDetail detail,
    DisplayCurrency currency,
  ) {
    final coins = double.tryParse(value) ?? 0.0;
    final total = coins * _marketPrice(detail, currency);
    _textCurrencyController.text = total.toString();
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args;
    final id = widget.id;
    final currency = ref.watch(currencyControllerProvider);
    final isFav = ref.watch(isFavoriteProvider(id));
    final detailAsync = ref.watch(coinDetailControllerProvider(id, currency));

    final displayName = args?.name ?? id;
    final displaySymbol = args?.symbol ?? id;
    final displayImage = args?.image ?? '';
    final displayRank = args?.marketCapRank;

    return Scaffold(
      appBar: DefaultAppbar(
        titleWidget: Row(
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
          onPressed: () => ref
              .read(coinDetailControllerProvider(id, currency).notifier)
              .refresh(),
        ),
        data: (state) {
          final detail = state.detail;
          final points = state.chartPoints;

          if (detail == null || points == null) {
            return const CoinDetailSkeleton();
          }

          _initConverters(detail, currency);

          final positive = positiveColor(context);
          final negative = negativeColor(context);
          final change24h = detail.marketData.changes['24h'];
          final range = state.range;
          final intraday = isIntraday(points);
          final reducedMotion = MediaQuery.disableAnimationsOf(context);

          return RefreshIndicator(
            onRefresh: () {
              _scrub.value = null;
              return ref
                  .read(coinDetailControllerProvider(id, currency).notifier)
                  .refresh();
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: ValueListenableBuilder<ChartPoint?>(
                        valueListenable: _scrub,
                        builder: (context, scrub, _) {
                          final price =
                              scrub?.price ??
                              detail.marketData.currentPrice[currency.name];

                          return Column(
                            crossAxisAlignment: .start,
                            children: [
                              if (price != null)
                                Text(
                                  Formatter.formatCurrency(
                                    price,
                                    currency: currency,
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
                              const SizedBox(width: 10),
                              if (scrub != null)
                                Text(
                                  formatPointTime(
                                    scrub.time,
                                    intraday: intraday,
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: defaultSecondaryColor(context),
                                    fontFeatures: const [
                                      FontFeature.tabularFigures(),
                                    ],
                                  ),
                                )
                              else if (change24h == null)
                                const NullText()
                              else
                                Row(
                                  children: [
                                    PriceChangeIcon(
                                      change24h > 0,
                                      label: Formatter.formatPercent(change24h),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '(24H)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: defaultTertiaryColor(context),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _RangeChips(
                    ranges: _ranges,
                    selected: range,
                    onSelected: (r) {
                      _scrub.value = null;
                      ref
                          .read(
                            coinDetailControllerProvider(id, currency).notifier,
                          )
                          .setRange(r);
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 230,
                    child: AnimatedOpacity(
                      duration: reducedMotion ? Duration.zero : AppDesign.base,
                      opacity: state.isRangeLoading ? 0.4 : 1,
                      child: points.length < 2
                          ? Center(
                              child: state.isRangeLoading
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                      ),
                                      child: Text(
                                        'Belum ada data grafik untuk rentang ini.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: defaultSecondaryColor(context),
                                        ),
                                      ),
                                    ),
                            )
                          : IgnorePointer(
                              ignoring: state.isRangeLoading,
                              child: PriceChart(
                                points: points,
                                currency: currency,
                                lineColor:
                                    points.first.price <= points.last.price
                                    ? positive
                                    : negative,
                                onScrub: (point) => _scrub.value = point,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: .circular(AppDesign.r10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 8.0,
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
                                  height: 16,
                                  child: Divider(thickness: 0.8),
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
                        child: OutlinedTextField(
                          controller: _textCoinController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircleAvatar(
                              radius: 1,
                              foregroundImage: NetworkImage(detail.image.small),
                              foregroundColor: Colors.transparent,
                            ),
                          ),
                          onChanged: (value) {
                            _currencyConverter(value, detail, currency);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedTextField(
                          controller: _textCurrencyController,
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                currency.label,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          onChanged: (value) {
                            _cryptoConverter(value, detail, currency);
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
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          for (var i = 0; i < ranges.length; i++) ...[
            if (i > 0) const SizedBox(width: 10),
            _RangeChip(
              label: ranges[i],
              selected: selected == ranges[i],
              onTap: () => onSelected(ranges[i]),
            ),
          ],
        ],
      ),
    );
  }
}

class _RangeChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RangeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final outline = Theme.of(context).colorScheme.outline;
    final accent = appAccentColor(context);
    final duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : AppDesign.base;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      onTap: onTap,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDesign.full),
          splashColor: accent.withValues(alpha: 0.14),
          highlightColor: Colors.transparent,
          hoverColor: accent.withValues(alpha: 0.08),
          focusColor: accent.withValues(alpha: 0.16),
          child: SizedBox(
            height: 44,
            child: Center(
              child: AnimatedContainer(
                duration: duration,
                curve: AppDesign.curve,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? accent.withValues(alpha: 0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDesign.full),
                  border: Border.all(color: selected ? accent : outline),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: selected ? accent : defaultSecondaryColor(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
