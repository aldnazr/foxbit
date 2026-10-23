import 'package:flutter/material.dart';

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(errorText),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(1),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              fixedSize: WidgetStateProperty.all(
                const Size(double.infinity, 40),
              ),
            ),
            child: const Text('Coba lagi'),
          ),
        ],
      ),
    );
  }
}
