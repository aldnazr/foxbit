import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/util.dart';
import 'package:vault_chain/shared/models/coin_detail_args.dart';
import 'package:vault_chain/features/insight/domain/trending_coin.dart';

class TrendingList extends StatelessWidget {
  final List<TrendingCoin> items;
  const TrendingList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Tidak ada trending'),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TRENDING',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: defaultTertiaryColor(context),
              ),
            ),
            const SizedBox(height: 8),
            ...items.take(7).map((c) {
              final change = c.priceChange24h;
              final changeColor = (change ?? 0) >= 0
                  ? positiveColor(context)
                  : negativeColor(context);
              return ListTile(
                contentPadding: EdgeInsets.zero,
                minTileHeight: 56,
                leading: c.thumbUrl != null
                    ? CircleAvatar(backgroundImage: NetworkImage(c.thumbUrl!))
                    : const CircleAvatar(child: Icon(Icons.monetization_on)),
                title: Text(
                  '${c.name} (${c.symbol.toUpperCase()})',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  'Rank #${c.marketCapRank ?? '-'}',
                  style: TextStyle(
                    fontSize: 12,
                    color: defaultTertiaryColor(context),
                  ),
                ),
                trailing: change != null
                    ? PriceChiplike(
                        change: change,
                        changeColor: changeColor,
                      )
                    : null,
                onTap: () {
                  context.push(
                    '/coin/${c.id}',
                    extra: CoinDetailArgs(
                      id: c.id,
                      name: c.name,
                      symbol: c.symbol,
                      image: c.thumbUrl ?? '',
                      marketCapRank: c.marketCapRank,
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PriceChiplike extends StatelessWidget {
  final double change;
  final Color changeColor;
  const PriceChiplike({super.key, required this.change, required this.changeColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: changeColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppDesign.full),
      ),
      child: Text(
        '${change >= 0 ? '+' : ''}${change.toStringAsFixed(2)}%',
        style: TextStyle(
          color: changeColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
