import 'package:flutter/material.dart';
import 'package:vault_chain/app/design/app_design.dart';

class AppTheme {
  static ThemeData get lightTheme => AppDesign.theme(.light);
  static ThemeData get darkTheme => AppDesign.theme(.dark);
}
