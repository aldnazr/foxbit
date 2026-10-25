import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foxbit/features/wallet/domain/watched_wallet.dart';
import 'package:foxbit/features/wallet/domain/wallet_validation.dart';
import 'package:foxbit/features/wallet/presentation/providers/wallet_providers.dart';

class AddWalletSheet extends ConsumerStatefulWidget {
  const AddWalletSheet({super.key});

  @override
  ConsumerState<AddWalletSheet> createState() => _AddWalletSheetState();
}

class _AddWalletSheetState extends ConsumerState<AddWalletSheet> {
  final _labelCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();

  Chain _chain = Chain.btc;
  String? _error;
  bool _saving = false;

  @override
  void dispose() {
    _labelCtrl.dispose();
    _addressCtrl.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration(
    BuildContext context, {
    required String label,
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: colors.outlineVariant),
    );

    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: colors.surfaceContainerHighest,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(color: colors.primary, width: 1.5),
      ),
    );
  }

  Future<void> _paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);

    if (!mounted || data?.text == null) return;

    _addressCtrl.text = data!.text!.trim();
    setState(() => _error = null);
  }

  Future<void> _submit() async {
    if (_saving) return;

    final addr = _addressCtrl.text.trim();
    final err = WalletValidation.validateAddress(_chain, addr);

    if (err != null) {
      setState(() => _error = err);
      return;
    }

    setState(() {
      _error = null;
      _saving = true;
    });

    try {
      final now = DateTime.now();

      final wallet = WatchedWallet(
        id: now.microsecondsSinceEpoch.toString(),
        label: _labelCtrl.text.trim(),
        chain: _chain,
        address: addr,
        addedAt: now,
      );

      await ref.read(walletsControllerProvider.notifier).add(wallet);

      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _error = e.toString().toLowerCase().contains('duplicate')
            ? 'Alamat ini sudah ada di daftar.'
            : 'Gagal menyimpan wallet. Silakan coba lagi.';
      });
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colors.outlineVariant,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tambah Wallet',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Pantau aset menggunakan alamat wallet publik.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Tutup',
                    onPressed: _saving ? null : () => context.pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: colors.surfaceContainerHighest,
                    ),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Network selector
              Text(
                'Jaringan blockchain',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              SegmentedButton<Chain>(
                segments: const [
                  ButtonSegment(
                    value: Chain.btc,
                    icon: Icon(Icons.currency_bitcoin),
                    label: Text('Bitcoin'),
                  ),
                  ButtonSegment(
                    value: Chain.eth,
                    icon: Icon(Icons.hexagon_outlined),
                    label: Text('Ethereum'),
                  ),
                ],
                selected: {_chain},
                expandedInsets: EdgeInsets.zero,
                onSelectionChanged: _saving
                    ? null
                    : (selection) {
                        setState(() {
                          _chain = selection.first;
                          _error = null;
                        });
                      },
              ),
              const SizedBox(height: 24),

              // Optional wallet label
              TextField(
                controller: _labelCtrl,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.next,
                decoration: _inputDecoration(
                  context,
                  label: 'Nama wallet',
                  hint: 'Contoh: Cold Wallet',
                  icon: Icons.label_outline,
                ),
              ),
              const SizedBox(height: 16),

              // Wallet address
              TextField(
                controller: _addressCtrl,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.none,
                autocorrect: false,
                enableSuggestions: false,
                maxLines: 2,
                minLines: 1,
                decoration: _inputDecoration(
                  context,
                  label: 'Alamat wallet',
                  hint: 'Tempel alamat BTC atau ETH',
                  icon: Icons.account_balance_wallet_outlined,
                  suffixIcon: IconButton(
                    tooltip: 'Tempel dari clipboard',
                    onPressed: _saving ? null : _paste,
                    icon: const Icon(Icons.content_paste_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Gunakan alamat publik, bukan private key atau seed phrase.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),

              // Validation / request error
              if (_error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colors.errorContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 20,
                        color: colors.onErrorContainer,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _error!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onErrorContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 28),

              // Submit button
              SizedBox(
                height: 52,
                child: FilledButton(
                  onPressed: _saving ? null : _submit,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _saving
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 12),
                            Text('Menyimpan...'),
                          ],
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 20),
                            SizedBox(width: 8),
                            Text('Simpan wallet'),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
