import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/features/insight/domain/global_market.dart';

class GlobalSummaryCard extends StatelessWidget {
  final GlobalMarket data;
  const GlobalSummaryCard({super.key, required this.data});

  String _compact(num v) => NumberFormat.compact(locale: 'en_US').format(v);

  @override
  Widget build(BuildContext context) {
    final change = data.marketCapChange24h;
    final changeColor =
        change >= 0 ? positiveColor(context) : negativeColor(context);
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
              '\$${_compact(data.totalMarketCapUsd)}',
              changeColor,
              '${change >= 0 ? '+' : ''}${change.toStringAsFixed(2)}%',
            ),
            const SizedBox(height: 12),
            _row(
              context,
              'Volume 24j',
              '\$${_compact(data.totalVolumeUsd)}',
              null,
              null,
            ),
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
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
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
