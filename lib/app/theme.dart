import 'package:material_ui/material_ui.dart';
import 'package:foxbit/app/design/app_design.dart';

class AppTheme {
  static ThemeData get lightTheme => AppDesign.theme(.light);
  static ThemeData get darkTheme => AppDesign.theme(.dark);
}
