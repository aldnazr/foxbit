import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/util.dart';

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
      appBar: AppBar(title: const Text('Dompet'), titleSpacing: 20),
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
                child: AppEntry(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: defaultContainer(context),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Dompet Watch-Only',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Pantau saldo dan riwayat transaksi dari alamat publik BTC/ETH. '
                        'Tidak ada private key atau transaksi.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      const _SecretBanner(),
                    ],
                  ),
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
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              children: [
                const _SecretBanner(),
                const SizedBox(height: 12),
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
                        decoration: BoxDecoration(
                          color: negativeColor(context).withValues(alpha: 0.9),
                          borderRadius:
                              BorderRadius.circular(AppDesign.r24),
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 24),
                        child: const Icon(Icons.delete_outline,
                            color: Colors.white, size: 22),
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
        child: const Icon(Icons.add, size: 26),
      ),
    );
  }
}

class _SecretBanner extends StatelessWidget {
  const _SecretBanner();
  @override
  Widget build(BuildContext context) {
    final color = warningColor(context);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppDesign.r16),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber, color: color, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Hanya alamat publik. Jangan pernah memasukkan seed phrase atau private key.',
              style: TextStyle(
                fontSize: 12,
                color: defaultSecondaryColor(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
