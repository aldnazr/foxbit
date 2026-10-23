import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vault_chain/features/wallet/presentation/providers/wallet_providers.dart';
import 'package:vault_chain/features/wallet/presentation/widgets/add_wallet_sheet.dart';
import 'package:vault_chain/features/wallet/presentation/widgets/wallet_card.dart';
import 'package:vault_chain/shared/widgets/error_handler.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletsAsync = ref.watch(walletsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dompet')),
      body: walletsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => ErrorHandler(
          errorText: e.toString(),
          onPressed: () => ref.invalidate(walletsControllerProvider),
        ),
        data: (wallets) {
          if (wallets.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 64,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Dompet Watch-Only',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Pantau saldo dan riwayat transaksi dari alamat publik BTC/ETH. '
                      'Tidak ada private key atau transaksi.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const _SecretBanner(),
                  ],
                ),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(walletsControllerProvider);
              for (final w in wallets) {
                ref.invalidate(walletBalanceProvider(w.id));
                ref.invalidate(walletTxsProvider(w.id));
              }
              ref.invalidate(fiatPricesProvider);
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              children: [
                const _SecretBanner(),
                const SizedBox(height: 8),
                ...wallets.map(
                  (w) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Dismissible(
                      key: ValueKey(w.id),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (_) async {
                        return await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Hapus alamat?'),
                            content: const Text(
                              'Alamat akan dihapus dari daftar.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Batal'),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(ctx, true),
                                child: const Text('Hapus'),
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (_) => ref
                          .read(walletsControllerProvider.notifier)
                          .remove(w.id),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: WalletCard(wallet: w),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const AddWalletSheet(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _SecretBanner extends StatelessWidget {
  const _SecretBanner();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.amber.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.warning_amber, color: Colors.amber),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Hanya alamat publik. Jangan pernah memasukkan seed phrase atau private key.',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
