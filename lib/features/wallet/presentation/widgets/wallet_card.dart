import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/display_currency.dart';
import 'package:foxbit/core/utils/formatter.dart';
import 'package:foxbit/core/utils/util.dart';

import 'package:foxbit/features/settings/application/currency_controller.dart';
import 'package:foxbit/features/wallet/domain/watched_wallet.dart';
import 'package:foxbit/features/wallet/presentation/providers/wallet_providers.dart';

class WalletCard extends ConsumerWidget {
  final WatchedWallet wallet;
  const WalletCard({super.key, required this.wallet});

  String _shortAddress(String addr) {
    if (addr.length <= 12) return addr;
    return '${addr.substring(0, 6)}…${addr.substring(addr.length - 4)}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.watch(currencyControllerProvider);
    final balanceAsync = ref.watch(walletBalanceProvider(wallet.id));
    final fiatAsync = ref.watch(fiatPricesProvider);
    final fiat = fiatAsync.asData?.value;
    final price = wallet.chain == Chain.btc
        ? (currency == DisplayCurrency.idr ? fiat?.btcIdr : fiat?.btcUsd)
        : (currency == DisplayCurrency.idr ? fiat?.ethIdr : fiat?.ethUsd);

    return Card(
      child: ListTile(
        onTap: () => context.push('/wallet/${wallet.id}'),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.r24),
        ),
        title: Text(
          wallet.label.isEmpty ? wallet.chain.label : wallet.label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          _shortAddress(wallet.address),
          style: TextStyle(
            fontSize: 12,
            fontFeatures: const [FontFeature.tabularFigures()],
            color: defaultTertiaryColor(context),
          ),
        ),
        trailing: balanceAsync.when(
          loading: () => const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          error: (e, _) => Text(
            e.toString(),
            style: TextStyle(fontSize: 11, color: negativeColor(context)),
          ),
          data: (b) {
            final fiatValue = b.coinAmount * (price ?? 0);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${b.coinAmount.toStringAsFixed(6)} ${wallet.chain.label}',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    fontFeatures: const [FontFeature.tabularFigures()],
                    color: defaultTitleColor(context),
                  ),
                ),
                if ((price ?? 0) > 0)
                  Text(
                    Formatter.formatCurrency(fiatValue, currency: currency),
                    style: TextStyle(
                      fontSize: 11,
                      color: defaultSecondaryColor(context),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
