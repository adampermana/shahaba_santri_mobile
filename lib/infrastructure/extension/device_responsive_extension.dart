import 'package:flutter/material.dart';

extension ContextExtensionss on BuildContext {
  /// The same of [MediaQuery.sizeOf(context)]
  Size get mediaQuerySize => MediaQuery.sizeOf(this);

  /// The same of [MediaQuery.of(context).size.height]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get height => mediaQuerySize.height;

  /// The same of [MediaQuery.of(context).size.width]
  /// Note: updates when you rezise your screen (like on a browser or
  /// desktop window)
  double get width => mediaQuerySize.width;

  /// Gives you the power to get a portion of the height.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the height
  ///
  /// [reducedBy] is a percentage value of how much of the height you want
  /// if you for example want 46% of the height, then you reduce it by 56%.
  double heightTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (mediaQuerySize.height -
            ((mediaQuerySize.height / 100) * reducedBy)) /
        dividedBy;
  }

  /// Gives you the power to get a portion of the width.
  /// Useful for responsive applications.
  ///
  /// [dividedBy] is for when you want to have a portion of the value you
  /// would get like for example: if you want a value that represents a third
  /// of the screen you can set it to 3, and you will get a third of the width
  ///
  /// [reducedBy] is a percentage value of how much of the width you want
  /// if you for example want 46% of the width, then you reduce it by 56%.
  double widthTransformer({double dividedBy = 1, double reducedBy = 0.0}) {
    return (mediaQuerySize.width - ((mediaQuerySize.width / 100) * reducedBy)) /
        dividedBy;
  }

  /// Divide the height proportionally by the given value
  double ratio({
    double dividedBy = 1,
    double reducedByW = 0.0,
    double reducedByH = 0.0,
  }) {
    return heightTransformer(dividedBy: dividedBy, reducedBy: reducedByH) /
        widthTransformer(dividedBy: dividedBy, reducedBy: reducedByW);
  }

  /// similar to [MediaQuery.of(context).padding]
  ThemeData get theme => Theme.of(this);

  /// Check if dark mode theme is enable
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// give access to Theme.of(context).iconTheme.color
  Color? get iconColor => theme.iconTheme.color;

  /// similar to [MediaQuery.of(context).padding]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// similar to [MediaQuery.paddingOf(context)]
  EdgeInsets get mediaQueryPadding => MediaQuery.paddingOf(this);

  /// similar to [MediaQuery.of(context).padding]
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// similar to [MediaQuery.viewPaddingOf(context)]
  EdgeInsets get mediaQueryViewPadding => MediaQuery.viewPaddingOf(this);

  /// similar to [MediaQuery.viewInsetsOf(context)]
  EdgeInsets get mediaQueryViewInsets => MediaQuery.viewInsetsOf(this);

  /// similar to [MediaQuery.orientationOf(context)]
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// check if device is on landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  /// check if device is on portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  /// similar to [MediaQuery.devicePixelRatioOf(this)]
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// similar to [MediaQuery.textScalerOf(this)]
  double get textScaleFactor => MediaQuery.textScalerOf(this).scale(1);

  /// get the shortestSide from screen
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  /// True if width be larger than 800
  bool get showNavbar => width > 800;

  /// Gunakan width karena lebih tepat untuk layout responsif
  double get screenWidth => mediaQuerySize.width;

  // Breakpoint Responsif
  // Patokan utama: width (kategori phone/tablet)
  // Patokan sekunder: height (tier small/medium/large dalam kategori)
  //
  // #Smartphone reference:
  //   Small       : 360×640  @2.0
  //   Galaxy S20  : 360×800  @4.0
  //   OnePlus 8Pro: 360×800  @4.0
  //   Medium      : 412×732  @2.0
  //   Sony Xperia : 411×960  @4.0
  //   Big         : 480×835  @2.0
  //
  // #Tablet reference:
  //   Small  : 800×1280  @2.0
  //   Medium : 1024×1350 @2.0
  //   Large  : 1280×1880 @2.0
  //

  // Kategori utama
  bool get isPhone => width < 600;
  bool get isTablet => width >= 600;

  // Phone tier (width < 600)
  // Narrow  : width < 390  → 360dp (Small, Galaxy S20, OnePlus 8 Pro)
  // Standard: 390–450      → 411–412dp (Sony Xperia, Medium)
  // Wide    : 450–600      → 480dp (Big phone)
  bool get isPhoneNarrow => width < 390;
  bool get isPhoneStandard => width >= 390 && width < 450;
  bool get isPhoneWide => width >= 450 && width < 600;

  // Phone height tier (berlaku dalam isPhone)
  // Short  : height < 750  → 640h (Small), 732h (Medium)
  // Tall   : 750–900       → 800h (Galaxy S20, OnePlus), 835h (Big)
  // XTall  : ≥ 900         → 960h (Sony Xperia)
  bool get isPhoneShort => isPhone && height < 750;
  bool get isPhoneTall => isPhone && height >= 750 && height < 900;
  bool get isPhoneXTall => isPhone && height >= 900;

  // Tablet tier (width ≥ 600)
  // Small  : 600–900   → 800dp wide
  // Medium : 900–1150  → 1024dp wide
  // Large  : ≥ 1150    → 1280dp wide
  bool get isTabletSmall => width >= 600 && width < 900;
  bool get isTabletMedium => width >= 900 && width < 1150;
  bool get isTabletLarge => width >= 1150;

  // Legacy aliases — kompatibel dengan kode lama
  // isPhoneSmall  → narrow width 360dp (Small, Galaxy S20, OnePlus)
  // isPhoneMedium → standard width 411–412dp (Medium, Sony Xperia)
  // isPhoneLarge  → wide width 480dp (Big phone)
  bool get isPhoneSmall => isPhoneNarrow;
  bool get isPhoneMedium => isPhoneStandard;
  bool get isPhoneLarge => isPhoneWide;
}
