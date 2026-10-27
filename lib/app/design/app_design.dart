import 'package:material_ui/material_ui.dart';

class AppDesign {
  // ---- Dark (near-OLED + glass) ----
  static const dBg = Color(0xFF000000);
  static const dSurface = Color(0xFF14171D);
  static const dSurfaceAlt = Color(0xFF1C2029);
  static const dHairline = Color(0x14FFFFFF);
  static const dTextPrimary = Color(0xFFF4F6F8);
  static const dTextSecondary = Color(0xFF9AA3AF);
  static const dTextTertiary = Color(0xFF667085);
  static const dPrimary = Color(0xFFFF4B00);
  static const dOnPrimary = Color(0xFFFFFFFF);
  static const dPositive = Color(0xFF34D399);
  static const dNegative = Color(0xFFF87171);
  static const dWarning = Color(0xFFFBBF24);

  // ---- Light (soft structuralism) ----
  static const lBg = Color(0xFFFBFCFE);
  static const lSurface = Color(0xFFFFFFFF);
  static const lSurfaceAlt = Color(0xFFF2F4F7);
  static const lHairline = Color(0x140B0D0F);
  static const lTextPrimary = Color(0xFF0B0D0F);
  static const lTextSecondary = Color(0xFF5A6472);
  static const lTextTertiary = Color(0xFF98A2B3);
  static const lPrimary = Color(0xFFFF4B00);
  static const lOnPrimary = Color(0xFFFFFFFF);
  static const lPositive = Color(0xFF0E9F6E);
  static const lNegative = Color(0xFFDC3D3D);
  static const lWarning = Color(0xFFB45309);

  // ---- Radius ----
  static const r8 = 8.0;
  static const r10 = 10.0;
  static const r16 = 16.0;
  static const r24 = 24.0;
  static const r28 = 28.0;
  static const full = 999.0;

  // ---- Spacing ----
  static const s2 = 2.0;
  static const s4 = 4.0;
  static const s8 = 8.0;
  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;
  static const s32 = 32.0;
  static const s40 = 40.0;

  // ---- Motion ----
  static const curve = Cubic(0.32, 0.72, 0, 1);
  static const fast = Duration(milliseconds: 150);
  static const base = Duration(milliseconds: 300);
  static const slow = Duration(milliseconds: 600);

  static Color hairline(Brightness b) =>
      b == Brightness.dark ? dHairline : lHairline;

  static Color bg(Brightness b) => b == Brightness.dark ? dBg : lBg;

  static Color surface(Brightness b) =>
      b == Brightness.dark ? dSurface : lSurface;

  static Color surfaceAlt(Brightness b) =>
      b == Brightness.dark ? dSurfaceAlt : lSurfaceAlt;

  static Color textPrimary(Brightness b) =>
      b == Brightness.dark ? dTextPrimary : lTextPrimary;

  static Color textSecondary(Brightness b) =>
      b == Brightness.dark ? dTextSecondary : lTextSecondary;

  static Color textTertiary(Brightness b) =>
      b == Brightness.dark ? dTextTertiary : lTextTertiary;

  static Color primary(Brightness b) =>
      b == Brightness.dark ? dPrimary : lPrimary;

  static Color onPrimary(Brightness b) =>
      b == Brightness.dark ? dOnPrimary : lOnPrimary;

  static Color positive(Brightness b) =>
      b == Brightness.dark ? dPositive : lPositive;

  static Color negative(Brightness b) =>
      b == Brightness.dark ? dNegative : lNegative;

  static Color warning(Brightness b) =>
      b == Brightness.dark ? dWarning : lWarning;

  static ThemeData theme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme(
      brightness: brightness,
      primary: primary(brightness),
      onPrimary: onPrimary(brightness),
      primaryContainer: surfaceAlt(brightness),
      onPrimaryContainer: textPrimary(brightness),
      secondary: secondaryColor(brightness),
      onSecondary: onPrimary(brightness),
      error: negative(brightness),
      onError: isDark ? dBg : lSurface,
      surface: surface(brightness),
      onSurface: textPrimary(brightness),
      surfaceContainerHighest: surfaceAlt(brightness),
      surfaceContainerHigh: surfaceAlt(brightness),
      surfaceContainer: surfaceAlt(brightness),
      outlineVariant: hairline(brightness),
      outline: hairline(brightness),
    );

    final base = isDark
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: bg(brightness),
      canvasColor: bg(brightness),
      textTheme: base.textTheme
          .apply(
            fontFamily: 'SFPro',
            bodyColor: textPrimary(brightness),
            displayColor: textPrimary(brightness),
          )
          .copyWith(
            titleMedium: TextStyle(
              fontFamily: 'SFPro',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textPrimary(brightness),
            ),
            titleSmall: TextStyle(
              fontFamily: 'SFPro',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: textPrimary(brightness),
            ),
            bodyMedium: TextStyle(
              fontFamily: 'SFPro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textSecondary(brightness),
            ),
            bodySmall: TextStyle(
              fontFamily: 'SFPro',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: textSecondary(brightness),
            ),
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleSpacing: 22,
        foregroundColor: textPrimary(brightness),
        titleTextStyle: TextStyle(
          fontFamily: 'SFPro',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimary(brightness),
        ),
        iconTheme: IconThemeData(color: textSecondary(brightness), size: 22),
      ),
      cardTheme: CardThemeData(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: surface(brightness),
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r24),
          side: BorderSide(color: hairline(brightness), width: 1),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: hairline(brightness),
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceAlt(brightness),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        hintStyle: TextStyle(color: textTertiary(brightness)),
        labelStyle: TextStyle(color: textSecondary(brightness)),
        floatingLabelStyle: TextStyle(
          color: primary(brightness),
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r16),
          borderSide: BorderSide(color: hairline(brightness)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r16),
          borderSide: BorderSide(color: hairline(brightness)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r16),
          borderSide: BorderSide(color: hairline(brightness)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r16),
          borderSide: BorderSide(color: primary(brightness), width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r16),
          borderSide: BorderSide(color: negative(brightness)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(r16),
          borderSide: BorderSide(color: negative(brightness), width: 1.4),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(double.maxFinite, 52)),
          backgroundColor: WidgetStatePropertyAll(primary(brightness)),
          foregroundColor: WidgetStatePropertyAll(onPrimary(brightness)),
          elevation: const WidgetStatePropertyAll(0),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontFamily: 'SFPro', fontWeight: FontWeight.w600),
          ),
          shape: const WidgetStatePropertyAll(StadiumBorder()),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(52)),
          foregroundColor: WidgetStatePropertyAll(textPrimary(brightness)),
          side: WidgetStatePropertyAll(BorderSide(color: hairline(brightness))),
          elevation: const WidgetStatePropertyAll(0),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontFamily: 'SFPro', fontWeight: FontWeight.w600),
          ),
          shape: const WidgetStatePropertyAll(StadiumBorder()),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(52)),
          backgroundColor: WidgetStatePropertyAll(surfaceAlt(brightness)),
          foregroundColor: WidgetStatePropertyAll(textPrimary(brightness)),
          elevation: const WidgetStatePropertyAll(0),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontFamily: 'SFPro', fontWeight: FontWeight.w600),
          ),
          shape: const WidgetStatePropertyAll(StadiumBorder()),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(primary(brightness)),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(fontFamily: 'SFPro', fontWeight: FontWeight.w600),
          ),
        ),
      ),
      iconTheme: IconThemeData(color: textSecondary(brightness)),
      listTileTheme: ListTileThemeData(
        iconColor: textSecondary(brightness),
        titleTextStyle: TextStyle(
          fontFamily: 'SFPro',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textPrimary(brightness),
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: 'SFPro',
          fontSize: 12,
          color: textTertiary(brightness),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: surfaceAlt(brightness),
        shape: const StadiumBorder(side: BorderSide(color: Colors.transparent)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface(brightness),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r28),
          side: BorderSide(color: hairline(brightness)),
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'SFPro',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: textPrimary(brightness),
        ),
        contentTextStyle: TextStyle(
          fontFamily: 'SFPro',
          fontSize: 14,
          color: textSecondary(brightness),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface(brightness),
        modalBackgroundColor: surface(brightness),
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(999)),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isDark ? dSurfaceAlt : dTextPrimary,
        contentTextStyle: TextStyle(
          fontFamily: 'SFPro',
          color: isDark ? dTextPrimary : lBg,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          shape: const WidgetStatePropertyAll(StadiumBorder()),
          side: WidgetStatePropertyAll(BorderSide(color: hairline(brightness))),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? (isDark
                      ? dPrimary.withValues(alpha: 0.12)
                      : lPrimary.withValues(alpha: 0.12))
                : Colors.transparent,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? primary(brightness)
                : textSecondary(brightness),
          ),
        ),
      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        labelColor: primary(brightness),
        unselectedLabelColor: textTertiary(brightness),
        labelStyle: const TextStyle(
          fontFamily: 'SFPro',
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'SFPro',
          fontWeight: FontWeight.w500,
        ),
        indicatorColor: primary(brightness),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStatePropertyAll(primary(brightness)),
        side: BorderSide(color: textTertiary(brightness)),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primary(brightness),
        linearTrackColor: surfaceAlt(brightness),
        circularTrackColor: isDark ? dSurfaceAlt : lSurfaceAlt,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary(brightness),
        foregroundColor: onPrimary(brightness),
        elevation: 0,
        highlightElevation: 0,
        shape: const StadiumBorder(),
      ),
      scrollbarTheme: const ScrollbarThemeData(
        thickness: WidgetStatePropertyAll(4),
      ),
      dividerColor: hairline(brightness),
      disabledColor: isDark
          ? dTextTertiary.withValues(alpha: .5)
          : lTextTertiary.withValues(alpha: .5),
    );
  }

  static Color secondaryColor(Brightness b) =>
      b == Brightness.dark ? dTextSecondary : lTextSecondary;
}

/// Light entry animation: fade + small translateY, GPU-safe.
class AppEntry extends StatelessWidget {
  final Widget child;
  final Duration duration;
  const AppEntry({
    super.key,
    required this.child,
    this.duration = AppDesign.base,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      curve: AppDesign.curve,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(
          offset: Offset(0, 12 * (1 - t)),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
