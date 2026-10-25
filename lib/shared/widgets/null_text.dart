import 'package:material_ui/material_ui.dart';
import 'package:foxbit/core/utils/util.dart';

class NullText extends StatelessWidget {
  const NullText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: defaultContainer(context),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        'Null',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: defaultTertiaryColor(context),
        ),
      ),
    );
  }
}
