import 'package:flutter/material.dart';

const MaterialColor primaryMColor = ColorPalette.primarySwatch;

class ColorPalette {
  // Primary colors (Figma: #1B8354)
  static const int _primaryColorValue = 0xFF1B8354;

  static const Color primaryColor = Color(_primaryColorValue);
  static const Color primary = Color(0xFF006D33);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF1B8354);
  static const Color onPrimaryContainer = Color(0xFF00401B);
  static const Color inversePrimary = Color(0xFF4CE17D);

  // Secondary colors
  static const Color secondary = Color(0xFF006D34);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFF8AFAA5);
  static const Color onSecondaryContainer = Color(0xFF007437);

  // Tertiary colors
  static const Color tertiary = Color(0xFFA9343A);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFF7476);
  static const Color onTertiaryContainer = Color(0xFF720717);

  // Error colors
  static const Color error = kRed300;
  static const Color onError = kRed300;
  static const Color errorContainer = kRed300;
  static const Color onErrorContainer = kRed300;

  // Surface & background colors
  static const Color surface = Color(0xFFFAF9F7);
  static const Color surfaceDim = Color(0xFFD4DCD1);
  static const Color surfaceBright = Color(0xFFFAF9F7);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFFFFFFF);
  static const Color surfaceContainer = Color(0xFFE8F0E5);
  static const Color surfaceContainerHigh = Color(0xFFE2EBDF);
  static const Color surfaceContainerHighest = Color(0xFFDCE5D9);
  static const Color surfaceTertiary = Color(0xFFE8E8E8);
  static const Color surfaceTint = Color(0xFF1B8354);
  static const Color background = Color(0xFF0F172A);
  static const Color scaffoldBackground = background;
  static const Color scaffoldBackgroundAppBar = background;

  // Content / text colors (semantic — matches Figma design tokens)
  static const Color onSurface = Color(0xFF161D16);
  static const Color onSurfaceVariant = Color(0xFF3D4A3E);
  static const Color onBackground = Color(0xFF161D16);
  static const Color contentSecondary = Color(0xFF4B4B4B);
  static const Color contentTertiary = Color(0xFF5E5E5E);
  static const Color contentDisabled = Color(0xFFA6A6A6);
  static const Color arabicText = Color(0xFF1A4D2E);

  // Inverse colors
  static const Color inverseSurface = Color(0xFF2B322B);
  static const Color inverseOnSurface = Color(0xFFEBF3E7);
  static const Color inverseSecondary = Color(0xFFDDDDDD);

  // Outline & border colors
  static const Color outline = Color(0xFF6D7B6C);
  static const Color outlineVariant = Color(0xFFBCCBBA);
  static const Color borderTransparent = Color(0x14000000); // rgba(0,0,0,0.08)
  static const Color surfaceTranslucent = Color(
    0x14FFFFFF,
  ); // rgba(255,255,255,0.08)
  static const Color surfaceTranslucentStrong = Color(
    0x4DFFFFFF,
  ); // rgba(255,255,255,0.30)
  static const Color rowDividerOnDark = Color(
    0x14FFFFFF,
  ); // rgba(255,255,255,0.08)
  static const Color shadowDarkSoft = Color(0x26333333); // rgba(51,51,51,0.15)
  // Surface variant (legacy)
  static const Color surfaceVariant = Color(0xFFDCE5D9);

  // Fixed colors (Material 3)
  static const Color primaryFixed = Color(0xFF6CFE96);
  static const Color primaryFixedDim = Color(0xFF4CE17D);
  static const Color onPrimaryFixed = Color(0xFF00210B);
  static const Color onPrimaryFixedVariant = Color(0xFF005225);
  static const Color secondaryFixed = Color(0xFF8AFAA5);
  static const Color secondaryFixedDim = Color(0xFF6EDD8B);
  static const Color onSecondaryFixed = Color(0xFF00210B);
  static const Color onSecondaryFixedVariant = Color(0xFF005225);
  static const Color tertiaryFixed = Color(0xFFFFDAD8);
  static const Color tertiaryFixedDim = Color(0xFFFFB3B1);
  static const Color onTertiaryFixed = Color(0xFF410007);
  static const Color onTertiaryFixedVariant = Color(0xFF891C25);

  // Primary swatch
  static const MaterialColor primarySwatch = MaterialColor(
    _primaryColorValue,
    <int, Color>{
      50: kGreen50,
      100: kGreen100,
      200: kGreen200,
      300: kGreen300,
      400: kGreen400,
      500: kGreen500,
      600: kGreen600,
      700: kGreen700,
      800: kGreen800,
      900: kGreen900,
    },
  );

  // Green scale
  static const Color kGreen50 = Color(0xFFF3FCF0);
  static const Color kGreen100 = Color(0xFFEEF6EA);
  static const Color kGreen200 = Color(0xFFDCE5D9);
  static const Color kGreen300 = Color(0xFF8AFAA5);
  static const Color kGreen400 = Color(0xFF6CFE96);
  static const Color kGreen500 = Color(0xFF4CE17D);
  static const Color kGreen600 = Color(0xFF1B8354);
  static const Color kGreen700 = Color(0xFF006D33);
  static const Color kGreen800 = Color(0xFF005225);
  static const Color kGreen900 = Color(0xFF00210B);

  // Red scale
  static const Color kRed50 = Color(0xFFFFDAD6);
  static const Color kRed100 = Color(0xFFFFB4AB);
  static const Color kRed200 = Color(0xFFFF897D);
  static const Color kRed300 = Color(0xFFFF5449);
  static const Color kRed400 = Color(0xFFDE3730);
  static const Color kRed500 = Color(0xFFBA1A1A);
  static const Color kRed600 = Color(0xFF93000A);
  static const Color kRed700 = Color(0xFF740006);
  static const Color kRed800 = Color(0xFF5F0004);
  static const Color kRed900 = Color(0xFF410002);

  // White scale
  static const Color kWhite = Colors.white;
  static const Color kWhite50 = Color(0xFFFFFFFF);
  static const Color kWhite100 = Color(0xFFF3FCF0);
  static const Color kWhite200 = Color(0xFFEEF6EA);
  static const Color kWhite300 = Color(0xFFE8F0E5);
  static const Color kWhite400 = Color(0xFFE2EBDF);
  static const Color kWhite500 = Color(0xFFDCE5D9);
  static const Color kWhite600 = Color(0xFFD4DCD1);
  static const Color kWhite700 = Color(0xFFBCCBBA);
  static const Color kWhite800 = Color(0xFF6D7B6C);
  static const Color kWhite900 = Color(0xFF3D4A3E);

  // Grey scale
  static const Color kGrey50 = Color(0xFFF3FCF0);
  static const Color kGrey100 = Color(0xFFEEF6EA);
  static const Color kGrey200 = Color(0xFFE8F0E5);
  static const Color kGrey300 = Color(0xFFDCE5D9);
  static const Color kGrey400 = Color(0xFFBCCBBA);
  static const Color kGrey500 = Color(0xFF6D7B6C);
  static const Color kGrey600 = Color(0xFF3D4A3E);
  static const Color kGrey700 = Color(0xFF2B322B);
  static const Color kGrey800 = Color(0xFF161D16);
  static const Color kGrey900 = Color(0xFF00210B);

  // Grey aliases
  static const Color kGray = kGrey200;
  static const Color kGray100 = kGrey300;
  static const Color kGray200 = outlineVariant;
  static const Color kGrayHintText = kGrey500;

  // Accent / utility colors
  static const Color kBlack = onSurface;
  static const Color kOrange = Color(0xFFED6E33);
  static const Color kOrange100 = Color(0xFFFFF3E8);
  static const Color kOrange200 = Color(0xFFFFC043);
  static const Color kBlue = Color(0xFF276EF1);
  static const Color kBlue100 = Color(0xFFEEF3FE);

  static final Color kBanerRed = Colors.red.withValues(alpha: 0.6);
  static final Color kBanerBlue = Colors.blue.withValues(alpha: 0.6);

  // Legacy purple aliases (point to green scale)
  static const Color kPurple = kGreen600;
  static const Color kPurple50 = kGreen50;
  static const Color kPurple100 = kGreen100;
  static const Color kPurple200 = kGreen200;
  static const Color kPurple300 = kGreen300;
  static const Color kPurple400 = kGreen400;
  static const Color kPurple500 = kGreen500;
  static const Color kPurple600 = kGreen600;
  static const Color kPurple700 = kGreen700;
  static const Color kPurple800 = kGreen800;
  static const Color kPurple900 = kGreen900;

  // Gradients
  static const LinearGradient kGradient = LinearGradient(
    begin: Alignment(0, 0.50),
    end: Alignment(1, 0.50),
    colors: [primaryContainer, secondaryContainer],
  );
}
