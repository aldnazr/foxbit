import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vault_chain/features/wallet/domain/watched_wallet.dart';
import 'package:vault_chain/features/wallet/domain/wallet_validation.dart';
import 'package:vault_chain/features/wallet/presentation/providers/wallet_providers.dart';

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

  Future<void> _paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data?.text != null) {
      _addressCtrl.text = data!.text!.trim();
    }
  }

  Future<void> _submit() async {
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
      final wallet = WatchedWallet(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        label: _labelCtrl.text.trim(),
        chain: _chain,
        address: addr,
        addedAt: DateTime.now(),
      );
      await ref.read(walletsControllerProvider.notifier).add(wallet);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() {
        _error = e.toString().contains('duplicate')
            ? 'Alamat ini sudah ada di daftar.'
            : 'Gagal menyimpan: $e';
      });
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 24,
        right: 24,
        top: 4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Tambah Alamat',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          SegmentedButton<Chain>(
            segments: const [
              ButtonSegment(value: Chain.btc, label: Text('BTC')),
              ButtonSegment(value: Chain.eth, label: Text('ETH')),
            ],
            selected: {_chain},
            onSelectionChanged: (s) => setState(() => _chain = s.first),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _labelCtrl,
            decoration: const InputDecoration(labelText: 'Label (opsional)'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _addressCtrl,
            decoration: InputDecoration(
              labelText: 'Alamat',
              suffixIcon: IconButton(
                onPressed: _paste,
                icon: const Icon(Icons.paste_outlined),
              ),
            ),
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(
              _error!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ],
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _saving ? null : _submit,
            child: _saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Simpan'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
