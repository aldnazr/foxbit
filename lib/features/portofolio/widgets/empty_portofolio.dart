import 'package:flutter/material.dart';
import 'package:vault_chain/core/utils/util.dart';

class EmptyPortofolio extends StatelessWidget {
  final VoidCallback? onAddTap;

  const EmptyPortofolio({super.key, this.onAddTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Card.filled(
        margin: const EdgeInsets.all(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Belum ada koin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: defaultTitleColor(context),
                ),
              ),
              const Text(
                'Tambahkan beberapa koin untuk mulai melacak harga mereka '
                'dan tetap mengikuti pergerakan.',
              ),
              ElevatedButton(
                onPressed: onAddTap,
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all<double>(1),
                  fixedSize: WidgetStateProperty.all(
                    const Size(double.infinity, 40),
                  ),
                ),
                child: const Text('Tambahkan Koin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
