import 'package:material_ui/material_ui.dart';
import 'package:vault_chain/app/design/app_design.dart';
import 'package:vault_chain/core/utils/util.dart';

class EmptyPortofolio extends StatelessWidget {
  final VoidCallback? onAddTap;

  const EmptyPortofolio({super.key, this.onAddTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: AppEntry(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: defaultContainer(context),
            borderRadius: BorderRadius.circular(AppDesign.r24),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: const Icon(Icons.star_outline, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                'Belum ada koin',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Tambahkan beberapa koin untuk mulai melacak harga mereka '
                'dan tetap mengikuti pergerakan.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: onAddTap,
                style: FilledButton.styleFrom(minimumSize: const Size(0, 48)),
                child: const Text('Tambahkan Koin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
