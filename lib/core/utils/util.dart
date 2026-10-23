import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vault_chain/app/design/app_design.dart';

Brightness _bright(BuildContext context) =>
    Theme.of(context).brightness;

Color defaultBackground(BuildContext context) =>
    Theme.of(context).colorScheme.surface;

Color defaultContainer(BuildContext context) =>
    AppDesign.surfaceAlt(_bright(context));

Color defaultTitleColor(BuildContext context) =>
    AppDesign.textPrimary(_bright(context));

Color defaultSecondaryColor(BuildContext context) =>
    AppDesign.textSecondary(_bright(context));

Color defaultTertiaryColor(BuildContext context) =>
    AppDesign.textTertiary(_bright(context));

Color positiveColor(BuildContext context) =>
    AppDesign.positive(_bright(context));

Color negativeColor(BuildContext context) =>
    AppDesign.negative(_bright(context));

Color warningColor(BuildContext context) =>
    AppDesign.warning(_bright(context));

Color appAccentColor(BuildContext context) =>
    AppDesign.primary(_bright(context));

Color lightBorderColor() => AppDesign.lHairline;

Color darkBorderColor() => AppDesign.dHairline;

Color customDarkContainer() => AppDesign.dSurfaceAlt;

Color customDarkOnContainer() => AppDesign.dTextSecondary;

Color customLightContainer() => AppDesign.lSurfaceAlt;

Color customLightOnContainer() => AppDesign.lTextSecondary;

Color defaultPrimaryContainer(BuildContext context) =>
    Theme.of(context).colorScheme.primaryContainer;

Color defaultOnPrimaryContainer(BuildContext context) =>
    Theme.of(context).colorScheme.onPrimaryContainer;

Future<bool?> isLogin() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLogin');
}
