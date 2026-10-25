import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';

import 'package:foxbit/features/wallet/presentation/providers/wallet_providers.dart';
import 'package:foxbit/features/wallet/presentation/widgets/add_wallet_sheet.dart';
import 'package:foxbit/features/wallet/presentation/widgets/wallet_card.dart';
import 'package:foxbit/shared/widgets/default_appbar.dart';
import 'package:foxbit/shared/widgets/error_handler.dart';

class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletsAsync = ref.watch(walletsControllerProvider);

    return Scaffold(
      appBar: DefaultAppbar(title: 'Dompet'),
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
              for (final wallet in wallets) {
                ref.invalidate(walletBalanceProvider(wallet.id));
                ref.invalidate(walletTxsProvider(wallet.id));
              }
              ref.invalidate(fiatPricesProvider);
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.fromLTRB(20, 4, 20, 12),
                  sliver: SliverToBoxAdapter(child: _SecretBanner()),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.builder(
                    itemCount: wallets.length,
                    itemBuilder: (context, index) {
                      final wallet = wallets[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Dismissible(
                          key: ValueKey(wallet.id),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (_) async {
                            return await showDialog<bool>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Hapus alamat?'),
                                content: const Text(
                                  'Alamat akan dihapus dari daftar.',
                                ),
                                actionsPadding: .only(
                                  top: 8,
                                  bottom: 20,
                                  right: 20,
                                  left: 20,
                                ),
                                actions: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: OutlinedButton(
                                      onPressed: () => ctx.pop(false),
                                      child: const Text('Batal'),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  FilledButton(
                                    onPressed: () => ctx.pop(true),
                                    child: const Text('Hapus'),
                                  ),
                                ],
                              ),
                            );
                          },
                          onDismissed: (_) => ref
                              .read(walletsControllerProvider.notifier)
                              .remove(wallet.id),
                          background: Container(
                            decoration: BoxDecoration(
                              color: negativeColor(context)
                                  .withValues(alpha: 0.9),
                              borderRadius: BorderRadius.circular(
                                AppDesign.r24,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 24),
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          child: WalletCard(wallet: wallet),
                        ),
                      );
                    },
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
          useSafeArea: true,
          showDragHandle: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
          ),
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
