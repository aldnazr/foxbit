import 'package:material_ui/material_ui.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';

class ErrorHandler extends StatelessWidget {
  final String errorText;
  final void Function() onPressed;

  const ErrorHandler({
    super.key,
    required this.errorText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: defaultContainer(context),
          borderRadius: BorderRadius.circular(AppDesign.r24),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 28),
            const SizedBox(height: 12),
            Text(
              errorText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(minimumSize: const Size(0, 44)),
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      ),
    );
  }
}
