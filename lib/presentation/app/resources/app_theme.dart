import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

class AppTheme {
  static const String _fontFamily = 'Satoshi';

  static ThemeData get lightTheme {
    const colorScheme = ColorScheme.light(
      primary: ColorPalette.primaryContainer,
      primaryContainer: ColorPalette.primaryFixed,
      onPrimaryContainer: ColorPalette.onPrimaryContainer,
      secondary: ColorPalette.secondary,
      onSecondary: ColorPalette.onSecondary,
      secondaryContainer: ColorPalette.secondaryContainer,
      onSecondaryContainer: ColorPalette.onSecondaryContainer,
      tertiary: ColorPalette.tertiary,
      onTertiary: ColorPalette.onTertiary,
      tertiaryContainer: ColorPalette.tertiaryContainer,
      onTertiaryContainer: ColorPalette.onTertiaryContainer,
      error: ColorPalette.error,
      errorContainer: ColorPalette.errorContainer,
      onErrorContainer: ColorPalette.onErrorContainer,
      surface: ColorPalette.surface,
      onSurface: ColorPalette.onSurface,
      onSurfaceVariant: ColorPalette.onSurfaceVariant,
      outline: ColorPalette.outline,
      outlineVariant: ColorPalette.outlineVariant,
      inverseSurface: ColorPalette.inverseSurface,
      onInverseSurface: ColorPalette.inverseOnSurface,
      inversePrimary: ColorPalette.inversePrimary,
      surfaceTint: ColorPalette.surfaceTint,
    );

    final base = ThemeData.light(useMaterial3: false).copyWith(
      colorScheme: colorScheme,
      primaryColor: ColorPalette.primaryColor,
      scaffoldBackgroundColor: ColorPalette.scaffoldBackground,
      dividerColor: ColorPalette.surfaceContainerHighest,
      unselectedWidgetColor: ColorPalette.outline,
      cardColor: ColorPalette.surfaceContainerLowest,
      shadowColor: ColorPalette.primaryColor.withValues(alpha: 0.08),
    );

    return _buildThemeData(base);
  }

  static ThemeData _buildThemeData(ThemeData base) {
    final textTheme = _buildTextTheme(base);

    return ThemeData(
      brightness: base.brightness,
      useMaterial3: false,
      colorScheme: base.colorScheme,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      appBarTheme: _buildAppBarTheme(base.copyWith(textTheme: textTheme)),
      tabBarTheme: _buildTabbarTheme(base.copyWith(textTheme: textTheme)),
      cardTheme: _buildCardTheme(base),
      cardColor: base.cardColor,
      iconTheme: _buildIconThemeData(base),
      inputDecorationTheme: _buildInputDecorationTheme(
        base.copyWith(textTheme: textTheme),
      ),
      floatingActionButtonTheme: _buildFloatingActionButtonTheme(base),
      elevatedButtonTheme: _buildElevatedButtonThemeData(base),
      textButtonTheme: _buildTextButtonThemeData(base),
      dividerTheme: _buildDividerTheme(base),
      checkboxTheme: _buildCheckboxThemeData(base),
      bottomNavigationBarTheme: _buildBottomNavigationBarTheme(base),
      chipTheme: _buildChipTheme(base, textTheme),
      primaryColor: base.primaryColor,
      scaffoldBackgroundColor: base.scaffoldBackgroundColor,
      dividerColor: base.dividerColor,
      unselectedWidgetColor: base.unselectedWidgetColor,
      shadowColor: base.shadowColor,
      switchTheme: _buildSwitchThemeData(base),
      radioTheme: _buildRadioThemeData(base),
    );
  }

  static AppBarTheme _buildAppBarTheme(ThemeData theme) {
    return AppBarTheme(
      centerTitle: false,
      backgroundColor: ColorPalette.scaffoldBackgroundAppBar,
      foregroundColor: ColorPalette.onSurface,
      elevation: 0,
      titleTextStyle: theme.textTheme.titleMedium?.copyWith(
        color: theme.colorScheme.onSurface,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: const IconThemeData(color: ColorPalette.kBlack),
      actionsIconTheme: const IconThemeData(color: ColorPalette.kBlack),
    );
  }

  static TabBarThemeData _buildTabbarTheme(ThemeData theme) {
    return TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: ColorPalette.primaryColor, width: 3),
        insets: EdgeInsets.symmetric(horizontal: 16),
      ),
      labelStyle: theme.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      labelColor: theme.colorScheme.primary,
      unselectedLabelStyle: theme.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
    );
  }

  static CardThemeData _buildCardTheme(ThemeData theme) {
    return CardThemeData(
      color: ColorPalette.surfaceContainerLowest,
      elevation: 1,
      margin: EdgeInsets.zero,
      shadowColor: theme.shadowColor,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  static FloatingActionButtonThemeData _buildFloatingActionButtonTheme(
    ThemeData theme,
  ) {
    return theme.floatingActionButtonTheme.copyWith(
      backgroundColor: ColorPalette.primaryColor,
      foregroundColor: ColorPalette.onPrimary,
      elevation: 2,
      shape: const CircleBorder(),
    );
  }

  static InputDecorationTheme _buildInputDecorationTheme(ThemeData theme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(999),
      borderSide: const BorderSide(color: ColorPalette.surfaceContainerHigh),
    );

    return InputDecorationTheme(
      filled: true,
      fillColor: ColorPalette.surfaceContainerLow,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 17,
      ),
      hintStyle: theme.textTheme.bodyMedium?.copyWith(
        color: ColorPalette.kGrayHintText.withValues(alpha: 0.55),
      ),
      labelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: ColorPalette.onSurfaceVariant,
      ),
      floatingLabelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: ColorPalette.primary,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: const BorderSide(color: ColorPalette.primaryColor),
      ),
      errorBorder: border.copyWith(
        borderSide: const BorderSide(color: ColorPalette.error),
      ),
      focusedErrorBorder: border.copyWith(
        borderSide: const BorderSide(color: ColorPalette.error),
      ),
    );
  }

  static ElevatedButtonThemeData _buildElevatedButtonThemeData(
    ThemeData theme,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        foregroundColor: ColorPalette.onPrimary,
        backgroundColor: ColorPalette.primaryColor,
        disabledForegroundColor: ColorPalette.onSurface.withValues(alpha: 0.38),
        disabledBackgroundColor: ColorPalette.surfaceContainerHighest,
        elevation: 2,
        shadowColor: ColorPalette.primaryColor.withValues(alpha: 0.18),
        textStyle: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }

  static TextButtonThemeData _buildTextButtonThemeData(ThemeData theme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        foregroundColor: theme.colorScheme.primary,
        textStyle: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }

  static CheckboxThemeData _buildCheckboxThemeData(ThemeData base) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorPalette.surfaceContainerHighest;
        }
        if (states.contains(WidgetState.selected)) {
          return ColorPalette.primaryColor;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all<Color>(ColorPalette.onPrimary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      side: const BorderSide(color: ColorPalette.outline),
    );
  }

  static BottomNavigationBarThemeData _buildBottomNavigationBarTheme(
    ThemeData base,
  ) {
    return BottomNavigationBarThemeData(
      backgroundColor: ColorPalette.surfaceContainerLowest,
      selectedItemColor: base.colorScheme.primary,
      unselectedItemColor: base.colorScheme.onSurfaceVariant,
      showSelectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static ChipThemeData _buildChipTheme(ThemeData base, TextTheme textTheme) {
    return ChipThemeData(
      selectedColor: base.colorScheme.primary,
      backgroundColor: ColorPalette.surfaceContainerLow,
      labelStyle: textTheme.labelMedium?.copyWith(
        color: base.colorScheme.onSurface,
      ),
      secondaryLabelStyle: textTheme.labelMedium?.copyWith(
        color: base.colorScheme.onPrimary,
      ),
      side: const BorderSide(color: ColorPalette.outlineVariant),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      elevation: 0,
      pressElevation: 0,
    );
  }

  static SwitchThemeData _buildSwitchThemeData(ThemeData base) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return ColorPalette.primaryColor;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return ColorPalette.primaryColor.withValues(alpha: 0.45);
        }
        return null;
      }),
    );
  }

  static RadioThemeData _buildRadioThemeData(ThemeData base) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return ColorPalette.primaryColor;
        }
        return ColorPalette.outline;
      }),
    );
  }

  static IconThemeData _buildIconThemeData(ThemeData theme) {
    return theme.iconTheme.copyWith(color: ColorPalette.kBlack);
  }

  static TextTheme _buildTextTheme(ThemeData base) {
    final textTheme = base.textTheme.apply(
      fontFamily: _fontFamily,
      displayColor: ColorPalette.kWhite,
      bodyColor: ColorPalette.kWhite,
      decorationColor: ColorPalette.kWhite,
    );

    return textTheme.copyWith(
      displayLarge: textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 36,
        height: 1.2,
        color: ColorPalette.kWhite,
      ),
      displayMedium: textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 36,
        height: 1.2,
        color: ColorPalette.kWhite,
      ),
      displaySmall: textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: 36,
        height: 1.2,
        color: ColorPalette.kWhite,
      ),
      headlineLarge: textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 28,
        height: 1.3,
        color: ColorPalette.kWhite,
      ),
      headlineMedium: textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 1.4,
        color: ColorPalette.kWhite,
      ),
      headlineSmall: textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 1.4,
        color: ColorPalette.kWhite,
      ),
      titleLarge: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 1.4,
        color: ColorPalette.kWhite,
      ),
      titleMedium: textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.4,
        color: ColorPalette.kWhite,
      ),
      titleSmall: textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.4,
        color: ColorPalette.kWhite,
      ),
      bodyLarge: textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        height: 1.6,
        color: ColorPalette.kWhite,
      ),
      bodyMedium: textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.6,
        color: ColorPalette.kWhite,
      ),
      bodySmall: textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.5,
        color: ColorPalette.onSurfaceVariant,
      ),
      labelLarge: textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.2,
        color: ColorPalette.kWhite,
      ),
      labelMedium: textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 1.2,
        color: ColorPalette.kWhite,
      ),
      labelSmall: textTheme.labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1,
        letterSpacing: 0.6,
        color: ColorPalette.kWhite,
      ),
    );
  }

  static DividerThemeData _buildDividerTheme(ThemeData base) {
    return base.dividerTheme.copyWith(
      color: ColorPalette.surfaceContainerHighest,
      thickness: 1,
      space: 1,
    );
  }
}
