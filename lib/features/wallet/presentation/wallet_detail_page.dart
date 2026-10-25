import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vault_chain/core/utils/util.dart';

import 'package:vault_chain/features/wallet/domain/watched_wallet.dart';
import 'package:vault_chain/features/wallet/domain/wallet_models.dart';
import 'package:vault_chain/features/wallet/presentation/providers/wallet_providers.dart';
import 'package:vault_chain/shared/widgets/error_handler.dart';

class WalletDetailPage extends ConsumerWidget {
  final String walletId;
  const WalletDetailPage({super.key, required this.walletId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletsAsync = ref.watch(walletsControllerProvider);
    final wallet = walletsAsync.value?.firstWhere(
      (w) => w.id == walletId,
      orElse: () => WatchedWallet(
        id: walletId,
        label: '',
        chain: Chain.btc,
        address: '',
        addedAt: DateTime.now(),
      ),
    );

    if (wallet == null || wallet.address.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail Dompet'), titleSpacing: 20),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final balanceAsync = ref.watch(walletBalanceProvider(walletId));
    final txsAsync = ref.watch(walletTxsProvider(walletId));
    final fiatAsync = ref.watch(fiatPricesProvider);

    double price = 0;
    double priceIdr = 0;
    if (fiatAsync.hasValue) {
      final f = fiatAsync.value!;
      if (wallet.chain == Chain.btc) {
        price = f.btcUsd;
        priceIdr = f.btcIdr;
      } else {
        price = f.ethUsd;
        priceIdr = f.ethIdr;
      }
    }

    final explorerUrl = wallet.chain == Chain.btc
        ? 'https://mempool.space/address/${wallet.address}'
        : 'https://etherscan.io/address/${wallet.address}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          wallet.label.isEmpty ? wallet.chain.label : wallet.label,
        ),
        titleSpacing: 20,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(walletBalanceProvider(walletId));
          ref.invalidate(walletTxsProvider(walletId));
          ref.invalidate(fiatPricesProvider);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SALDO',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: defaultTertiaryColor(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    balanceAsync.when(
                      loading: () => const CircularProgressIndicator(),
                      error: (e, _) => Text(
                        e.toString(),
                        style: TextStyle(color: negativeColor(context)),
                      ),
                      data: (b) {
                        final usd = b.coinAmount * price;
                        final idr = b.coinAmount * priceIdr;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${b.coinAmount.toStringAsFixed(8)} ${wallet.chain.label}',
                              style: TextStyle(
                                fontFamily: 'SFPro',
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                                fontFeatures: const [
                                  FontFeature.tabularFigures(),
                                ],
                                color: defaultTitleColor(context),
                              ),
                            ),
                            if (price > 0) ...[
                              Text(
                                '≈ \$${usd.toStringAsFixed(2)}',
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                '≈ Rp ${idr.toStringAsFixed(0)}',
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: wallet.address),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Alamat disalin'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy_outlined, size: 18),
                            label: const Text('Salin'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () async {
                              final uri = Uri.tryParse(explorerUrl);
                              if (uri != null) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            icon:
                                const Icon(Icons.open_in_new, size: 18),
                            label: const Text('Explorer'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      wallet.address,
                      style: TextStyle(
                        fontSize: 12,
                        color: defaultTertiaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Transaksi Terbaru',
              style: TextStyle(
                fontFamily: 'SFPro',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: defaultSecondaryColor(context),
              ),
            ),
            const SizedBox(height: 12),
            txsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => ErrorHandler(
                errorText: e.toString(),
                onPressed: () => ref.invalidate(walletTxsProvider(walletId)),
              ),
              data: (txs) {
                if (txs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('Belum ada transaksi')),
                  );
                }
                return Column(
                  children: txs
                      .map((t) => _TxTile(
                          key: ValueKey(t.hashCode), tx: t, symbol: wallet.chain.label))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TxTile extends StatelessWidget {
  final WalletTx tx;
  final String symbol;
  const _TxTile({super.key, required this.tx, required this.symbol});

  @override
  Widget build(BuildContext context) {
    final color =
        tx.isIn ? positiveColor(context) : negativeColor(context);
    final sign = tx.isIn ? '+' : '-';
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.12),
            ),
            child: Icon(
              tx.isIn ? Icons.arrow_downward : Icons.arrow_upward,
              color: color,
              size: 18,
            ),
          ),
          title: Text(
            '$sign${tx.amountCoin.toStringAsFixed(8)} $symbol',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFeatures: const [FontFeature.tabularFigures()],
              color: defaultTitleColor(context),
            ),
          ),
          subtitle: Text(
            tx.time != null ? tx.time.toString() : 'Pending',
            style: TextStyle(
              fontSize: 12,
              color: defaultTertiaryColor(context),
            ),
          ),
          trailing: Text(
            tx.confirmed ? 'Confirmed' : 'Pending',
            style: TextStyle(
              color: tx.confirmed
                  ? positiveColor(context)
                  : warningColor(context),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
