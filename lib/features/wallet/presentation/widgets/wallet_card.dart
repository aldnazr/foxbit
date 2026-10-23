import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:vault_chain/features/wallet/domain/watched_wallet.dart';
import 'package:vault_chain/features/wallet/presentation/providers/wallet_providers.dart';

class WalletCard extends ConsumerWidget {
  final WatchedWallet wallet;
  const WalletCard({super.key, required this.wallet});

  String _shortAddress(String addr) {
    if (addr.length <= 12) return addr;
    return '${addr.substring(0, 6)}…${addr.substring(addr.length - 4)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceAsync = ref.watch(walletBalanceProvider(wallet.id));
    final fiatAsync = ref.watch(fiatPricesProvider);
    final fiat = fiatAsync.asData?.value;
    final price = wallet.chain == Chain.btc
        ? (fiat?.btcUsd ?? 0)
        : (fiat?.ethUsd ?? 0);

    return Card(
      child: ListTile(
        onTap: () => context.push('/wallet/${wallet.id}'),
        // will use go_router instead; override below
        title: Text(wallet.label.isEmpty ? wallet.chain.label : wallet.label),
        subtitle: Text(_shortAddress(wallet.address)),
        trailing: balanceAsync.when(
          loading: () => const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          error: (e, _) => Text(
            e.toString(),
            style: const TextStyle(fontSize: 11, color: Colors.red),
          ),
          data: (b) {
            final fiatUsd = b.coinAmount * price;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${b.coinAmount.toStringAsFixed(6)} ${wallet.chain.label}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                if (price > 0)
                  Text(
                    '\$${fiatUsd.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
