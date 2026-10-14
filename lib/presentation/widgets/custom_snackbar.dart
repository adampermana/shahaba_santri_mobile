import 'package:flutter/material.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';

const Duration kSnackBarDuration = Duration(milliseconds: 1500);

enum SnackBarType { success, failure, networkInfo, info, quran, authSuccess }

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    required String message,
    super.key,
    SnackBarType type = SnackBarType.success,
    IconData? iconData,
    super.action,
    EdgeInsetsGeometry? margin,
  }) : super(
         content: _buildContent(type, message, iconData),
         backgroundColor: _getBackgroundColor(type),
         duration: _getDuration(type),
         behavior: _getBehavior(type),
         shape: _getShape(type),
         width: _getWidth(type),
         padding: _getPadding(type),
         margin: _getMargin(type, margin),
         elevation: _getElevation(type),
       );
  // Factory constructors untuk kemudahan penggunaan
  factory CustomSnackBar.success({
    required String message,
    Key? key,
    SnackBarAction? action,
  }) {
    return CustomSnackBar(message: message, key: key, action: action);
  }

  factory CustomSnackBar.authSuccess({
    required String message,
    Key? key,
  }) {
    return CustomSnackBar(
      message: message,
      key: key,
      type: SnackBarType.authSuccess,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
    );
  }

  factory CustomSnackBar.failure({
    required String message,
    Key? key,
    EdgeInsetsGeometry? margin,
  }) {
    return CustomSnackBar(
      message: message,
      key: key,
      type: SnackBarType.failure,
      margin: margin,
    );
  }

  factory CustomSnackBar.networkInfo({
    required String message,
    Key? key,
    IconData iconData = Icons.wifi_rounded,
  }) {
    return CustomSnackBar(
      message: message,
      key: key,
      type: SnackBarType.networkInfo,
      iconData: iconData,
    );
  }

  factory CustomSnackBar.info({
    required String message,
    Key? key,
    EdgeInsetsGeometry? margin,
  }) {
    return CustomSnackBar(
      message: message,
      key: key,
      type: SnackBarType.info,
      margin: margin,
    );
  }

  factory CustomSnackBar.quran({
    required String message,
    Key? key,
    EdgeInsetsGeometry? margin,
  }) {
    return CustomSnackBar(
      message: message,
      key: key,
      type: SnackBarType.quran,
      margin: margin,
    );
  }

  static Widget _buildContent(
    SnackBarType type,
    String message,
    IconData? iconData,
  ) {
    switch (type) {
      case SnackBarType.networkInfo:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData ?? Icons.wifi_rounded,
              color: ColorPalette.kBanerRed,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              message,
              style: const TextStyle(
                color: ColorPalette.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      case SnackBarType.success:
      case SnackBarType.failure:
        return Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        );
      case SnackBarType.info:
        return Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        );
      case SnackBarType.quran:
        return Text(
          message,
          style: const TextStyle(
            color: ColorPalette.kBlack,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        );
      case SnackBarType.authSuccess:
        return Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Satoshi',
            color: ColorPalette.kWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
    }
  }

  static Color _getBackgroundColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.failure:
        return Colors.red;
      case SnackBarType.networkInfo:
        return Colors.white;
      case SnackBarType.info:
        return const Color(0xFF171A20);
      case SnackBarType.quran:
        return ColorPalette.kWhite;
      case SnackBarType.authSuccess:
        return const Color(0xFF222A3B);
    }
  }

  static Duration _getDuration(SnackBarType type) {
    switch (type) {
      case SnackBarType.networkInfo:
        return const Duration(milliseconds: 1200);
      case SnackBarType.success:
      case SnackBarType.failure:
      case SnackBarType.info:
      case SnackBarType.quran:
      case SnackBarType.authSuccess:
        return kSnackBarDuration;
    }
  }

  static SnackBarBehavior? _getBehavior(SnackBarType type) {
    switch (type) {
      case SnackBarType.failure:
      case SnackBarType.networkInfo:
      case SnackBarType.info:
      case SnackBarType.quran:
      case SnackBarType.authSuccess:
        return SnackBarBehavior.floating;
      case SnackBarType.success:
        return null;
    }
  }

  static ShapeBorder? _getShape(SnackBarType type) {
    if (type == SnackBarType.networkInfo) {
      return const StadiumBorder();
    }
    if (type == SnackBarType.info ||
        type == SnackBarType.quran ||
        type == SnackBarType.authSuccess) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
    }
    return null;
  }

  static double? _getElevation(SnackBarType type) {
    if (type == SnackBarType.authSuccess) {
      return 4;
    }
    return null;
  }

  static double? _getWidth(SnackBarType type) {
    if (type == SnackBarType.networkInfo) {
      return 180;
    }
    return null;
  }

  static EdgeInsetsGeometry? _getPadding(SnackBarType type) {
    if (type == SnackBarType.authSuccess) {
      return const EdgeInsets.all(16);
    }
    return null;
  }

  static EdgeInsetsGeometry? _getMargin(
    SnackBarType type,
    EdgeInsetsGeometry? customMargin,
  ) {
    if (type == SnackBarType.failure && customMargin != null) {
      return customMargin.add(const EdgeInsets.fromLTRB(15, 5, 15, 10));
    }
    return customMargin;
  }
}
