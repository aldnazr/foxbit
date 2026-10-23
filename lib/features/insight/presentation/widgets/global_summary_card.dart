import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vault_chain/features/insight/domain/global_market.dart';

class GlobalSummaryCard extends StatelessWidget {
  final GlobalMarket data;
  const GlobalSummaryCard({super.key, required this.data});

  String _compact(num v) => NumberFormat.compact(locale: 'en_US').format(v);

  @override
  Widget build(BuildContext context) {
    final change = data.marketCapChange24h;
    final changeColor = change >= 0 ? Colors.green : Colors.red;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ringkasan Pasar Global',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _row(
              'Total Market Cap',
              '\$${_compact(data.totalMarketCapUsd)}',
              changeColor,
              '${change >= 0 ? '+' : ''}${change.toStringAsFixed(2)}%',
            ),
            const SizedBox(height: 8),
            _row(
              'Volume 24j',
              '\$${_compact(data.totalVolumeUsd)}',
              null,
              null,
            ),
            const SizedBox(height: 8),
            _row(
              'Dominasi BTC',
              '${data.btcDominance.toStringAsFixed(1)}%',
              null,
              null,
            ),
            const SizedBox(height: 8),
            _row(
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
    String label,
    String value,
    Color? changeColor,
    String? changeText,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Row(
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
            if (changeText != null) ...[
              const SizedBox(width: 8),
              Text(
                changeText,
                style: TextStyle(
                  color: changeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
