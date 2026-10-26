import 'package:material_ui/material_ui.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';

class OutlinedTextField extends StatelessWidget {
  const OutlinedTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.keyboardType = TextInputType.number,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 14, height: 1.8),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDesign.r10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDesign.r10),
          borderSide: BorderSide(color: appAccentColor(context), width: 1.5),
        ),
        prefixIcon: prefixIcon,
      ),
      onChanged: onChanged,
    );
  }
}
