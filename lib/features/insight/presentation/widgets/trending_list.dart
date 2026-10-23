import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...items.take(7).map((c) {
              final change = c.priceChange24h;
              final changeColor = (change ?? 0) >= 0
                  ? Colors.green
                  : Colors.red;
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: c.thumbUrl != null
                    ? CircleAvatar(backgroundImage: NetworkImage(c.thumbUrl!))
                    : const CircleAvatar(child: Icon(Icons.monetization_on)),
                title: Text('${c.name} (${c.symbol.toUpperCase()})'),
                subtitle: Text('Rank #${c.marketCapRank ?? '-'}'),
                trailing: change != null
                    ? Text(
                        '${change >= 0 ? '+' : ''}${change.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: changeColor,
                          fontWeight: FontWeight.w600,
                        ),
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
