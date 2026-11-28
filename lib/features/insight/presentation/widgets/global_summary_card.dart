import 'package:material_ui/material_ui.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/formatter.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/insight/domain/global_market.dart';

class GlobalSummaryCard extends StatelessWidget {
  final GlobalMarket data;
  final DisplayCurrency currency;
  const GlobalSummaryCard({
    super.key,
    required this.data,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final change = data.marketCapChange24h;
    final changeColor = change >= 0
        ? positiveColor(context)
        : negativeColor(context);
    final marketCap = currency == DisplayCurrency.idr
        ? data.totalMarketCapIdr
        : data.totalMarketCapUsd;
    final volume = currency == DisplayCurrency.idr
        ? data.totalVolumeIdr
        : data.totalVolumeUsd;
    final marketCapText = marketCap > 0
        ? Formatter.formatCompactCurrency(marketCap, currency)
        : '--';
    final volumeText = volume > 0
        ? Formatter.formatCompactCurrency(volume, currency)
        : '--';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RINGKASAN PASAR GLOBAL',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: defaultTertiaryColor(context),
              ),
            ),
            const SizedBox(height: 12),
            _row(
              context,
              'Total Market Cap',
              marketCapText,
              changeColor,
              '${change >= 0 ? '+' : ''}${change.toStringAsFixed(2)}%',
            ),
            const SizedBox(height: 12),
            _row(context, 'Volume 24j', volumeText, null, null),
            const SizedBox(height: 12),
            _row(
              context,
              'Dominasi BTC',
              '${data.btcDominance.toStringAsFixed(1)}%',
              null,
              null,
            ),
            const SizedBox(height: 12),
            _row(
              context,
              'Dominasi ETH',
              '${data.ethDominance.toStringAsFixed(1)}%',
              null,
              null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String value,
    Color? changeColor,
    String? changeText,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            if (changeText != null) ...[
              const SizedBox(width: 8),
              Text(
                changeText,
                style: TextStyle(
                  color: changeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
