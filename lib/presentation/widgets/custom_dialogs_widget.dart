import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';

import 'package:sahaba_mobile/infrastructure/extension/device_responsive_extension.dart';
import 'package:sahaba_mobile/infrastructure/failures/alert.dart';
import 'package:sahaba_mobile/infrastructure/failures/failures.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/widgets/cache_images.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

/// Reusable custom dialog widget.
///
/// Supports two layout variants:
/// - **withSecondaryAction**: shows a primary button + secondary text button below (e.g. "Masuk/Daftar" + "Nanti Saja")
/// - **default**: shows only the primary button (e.g. "Lengkapi Sekarang")
///
/// Usage:
/// ```dart
/// showCustomDialog(
///   context: context,
///   dialog: CustomDialog(
///     title: 'Masuk untuk Melanjutkan',
///     description:
///         'Fitur scan hanya tersedia untuk pengguna yang sudah masuk.',
///     primaryButtonText: 'Masuk / Daftar',
///     onPrimaryPressed: () { ... },
///     secondaryButtonText: 'Nanti Saja',
///     onSecondaryPressed: () { ... },
///   ),
/// );
/// ```
enum CustomDialogAnimationType { fadeScale, slideUp, popBounce }

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  required CustomDialog dialog,
  bool animation = true,
  CustomDialogAnimationType animationType = CustomDialogAnimationType.popBounce,
  bool? barrierDismissible,
}) {
  final effectiveBarrierDismissible =
      barrierDismissible ?? dialog.barrierDismissible;

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: effectiveBarrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54,
    transitionDuration: animation
        ? const Duration(milliseconds: 260)
        : Duration.zero,
    pageBuilder: (context, animation, secondaryAnimation) {
      return dialog._withBarrierDismissible(effectiveBarrierDismissible);
    },
    transitionBuilder: (context, routeAnimation, secondaryAnimation, child) {
      if (!animation) return child;

      return switch (animationType) {
        CustomDialogAnimationType.fadeScale => _fadeScaleTransition(
          routeAnimation,
          child,
        ),
        CustomDialogAnimationType.slideUp => _slideUpTransition(
          routeAnimation,
          child,
        ),
        CustomDialogAnimationType.popBounce => _popBounceTransition(
          routeAnimation,
          child,
        ),
      };
    },
  );
}

Widget _fadeScaleTransition(Animation<double> animation, Widget child) {
  final fade = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );
  final scale = Tween<double>(begin: 0.96, end: 1).animate(fade);

  return FadeTransition(
    opacity: fade,
    child: ScaleTransition(scale: scale, child: child),
  );
}

Widget _slideUpTransition(Animation<double> animation, Widget child) {
  final fade = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );
  final offset = Tween<Offset>(
    begin: const Offset(0, 0.06),
    end: Offset.zero,
  ).animate(fade);

  return FadeTransition(
    opacity: fade,
    child: SlideTransition(position: offset, child: child),
  );
}

Widget _popBounceTransition(Animation<double> animation, Widget child) {
  final fade = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOutCubic,
    reverseCurve: Curves.easeInCubic,
  );
  final scale = Tween<double>(begin: 0.88, end: 1).animate(
    CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeInCubic,
    ),
  );

  return FadeTransition(
    opacity: fade,
    child: ScaleTransition(scale: scale, child: child),
  );
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.title = '',
    this.description,
    this.descriptionWidget,
    this.primaryButtonText = 'Konfirmasi',
    this.secondaryButtonText,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.isLoading = false,
    this.barrierDismissible = true,
    this.icon,
    this.primaryButtonColor,
    this.titleColor,
    this.descriptionColor,
    this.backgroundColor,
    this.child,
    this.content,
    this.insetPadding,
    this.borderRadius = 16,
  });

  /// Title text shown at the top of the dialog.
  final String title;

  /// Optional description shown below the title.
  final String? description;

  /// Optional description widget (e.g. RichText) shown below the title.
  /// Takes priority over [description] when both are provided.
  final Widget? descriptionWidget;

  /// Text for the primary (elevated) button.
  final String primaryButtonText;

  /// Text for the secondary (text) button.
  /// If null, the secondary button is hidden.
  final String? secondaryButtonText;

  /// Callback for the primary button tap.
  final VoidCallback? onPrimaryPressed;

  /// Callback for the secondary button tap.
  final VoidCallback? onSecondaryPressed;

  /// Shows a loading indicator on the primary button when true.
  final bool isLoading;

  /// Whether the dialog can be dismissed by tapping outside.
  final bool barrierDismissible;

  /// Optional icon/widget shown above the title.
  final Widget? icon;

  /// Custom color for the primary button.
  /// Defaults to [ColorPalette.primaryColor].
  final Color? primaryButtonColor;

  /// Custom color for the title text.
  final Color? titleColor;

  /// Custom color for the description text.
  final Color? descriptionColor;

  /// Custom dialog background color.
  final Color? backgroundColor;

  /// Optional custom content widget shown between description and primary
  /// button.
  final Widget? child;

  /// Replaces the default title/description/buttons layout when provided.
  final Widget? content;

  /// Optional dialog inset padding.
  final EdgeInsets? insetPadding;

  /// Dialog corner radius.
  final double borderRadius;

  CustomDialog _withBarrierDismissible(bool value) {
    if (barrierDismissible == value) return this;

    return CustomDialog(
      key: key,
      title: title,
      description: description,
      descriptionWidget: descriptionWidget,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      onPrimaryPressed: onPrimaryPressed,
      onSecondaryPressed: onSecondaryPressed,
      isLoading: isLoading,
      barrierDismissible: value,
      icon: icon,
      primaryButtonColor: primaryButtonColor,
      titleColor: titleColor,
      descriptionColor: descriptionColor,
      backgroundColor: backgroundColor,
      content: content,
      insetPadding: insetPadding,
      borderRadius: borderRadius,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: barrierDismissible,
      child: Dialog(
        insetPadding: insetPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ?? const Color(0xffF0E9E0),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child:
              content ??
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Optional icon
                    if (icon != null) ...[
                      Center(child: icon),
                      const SizedBox(height: 16),
                    ],

                    // Title
                    Center(
                      child: Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(color: titleColor),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description
                    if (descriptionWidget != null) ...[
                      const SizedBox(height: 8),
                      descriptionWidget!,
                    ] else if (description != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        description!,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: context.isTabletLarge
                              ? 20
                              : context.isTabletMedium
                              ? 20
                              : context.isTabletSmall
                              ? 20
                              : context.isPhoneLarge
                              ? 19
                              : context.isPhoneMedium
                              ? 14
                              : context.isPhoneSmall
                              ? 14
                              : 14,
                          fontWeight: FontWeight.w400,
                          color:
                              descriptionColor ??
                              Colors.black.withValues(alpha: 0.6),
                        ),
                      ),
                    ],

                    // Optional custom child content
                    if (child != null) ...[const SizedBox(height: 16), child!],

                    const SizedBox(height: 40),

                    // Primary button
                    SubmitButtonStylesWidget(
                      style: SubmitButtonStyle.elevated,
                      textButton: primaryButtonText,
                      primaryColor:
                          primaryButtonColor ?? ColorPalette.primaryColor,
                      isLoading: isLoading,
                      onPressed: isLoading ? null : onPrimaryPressed,
                    ),

                    // Secondary button (optional)
                    if (secondaryButtonText != null) ...[
                      const SizedBox(height: 8),
                      SubmitButtonStylesWidget(
                        style: SubmitButtonStyle.outlined,
                        textButton: secondaryButtonText,
                        onPressed: onSecondaryPressed,
                      ),
                    ],
                  ],
                ),
              ),
        ),
      ),
    );
  }
}

/// Shortcut untuk menampilkan dialog "Fitur Belum Tersedia".
///
/// Usage:
/// ```dart
/// onTap: () => showComingSoonDialog(context),
/// ```
Future<void> showComingSoonDialog(BuildContext context) async {
  await showCustomDialog<void>(
    context: context,
    dialog: CustomDialog(
      icon: const CacheImageOrSvg(source: 'assets/svg/wrench-fill.svg'),
      title: 'Fitur Belum Tersedia',
      description:
          'Kami sedang mengembangkan fitur ini agar dapat memberikan '
          'manfaat yang optimal bagi Anda. '
          'Fitur ini akan tersedia dalam waktu dekat.',
      primaryButtonText: 'Mengerti',
      onPrimaryPressed: () => Navigator.of(context).pop(),
    ),
  );
}

Future<void> showAlertDialog(
  BuildContext context, {
  Alert? alert,
  String? title,
  String? message,
  FutureOr<void> Function()? onRefresh,
  VoidCallback? onSkip,
  Color? titleColor,
  Color? messageColor,
  Color? iconColor,
  Color? backgroundColor,
}) {
  return CustomAlertDialog.showAlertDialog(
    context,
    alert: alert,
    title: title,
    message: message,
    onRefresh: onRefresh,
    onSkip: onSkip,
    titleColor: titleColor,
    messageColor: messageColor,
    iconColor: iconColor,
    backgroundColor: backgroundColor,
  );
}

class CustomAlertDialog {
  static bool _isLocationAlertDialogShowing = false;
  static bool _isLocationAlertActionRunning = false;

  static Future<void> showAlertDialog(
    BuildContext context, {
    Alert? alert,
    String? title,
    String? message,
    FutureOr<void> Function()? onRefresh,
    VoidCallback? onSkip,
    Color? titleColor,
    Color? messageColor,
    Color? iconColor,
    Color? backgroundColor,
  }) async {
    if (alert is LocationAlert || alert is PermissionAlert) {
      if (_isLocationAlertDialogShowing || _isLocationAlertActionRunning) {
        return;
      }
      _isLocationAlertDialogShowing = true;
      final actionCompleter = Completer<void>();

      await showCustomDialog<void>(
        context: context,
        barrierDismissible: Platform.isIOS,
        dialog: CustomDialog(
          title: title ?? 'Izinkan Akses Lokasi',
          barrierDismissible: Platform.isIOS,
          icon: Icon(
            Icons.location_on,
            size: 48,
            color: iconColor ?? ColorPalette.kBlack,
          ),
          description: message,
          titleColor: titleColor,
          descriptionColor: messageColor,
          backgroundColor: backgroundColor,
          onPrimaryPressed: () async {
            _isLocationAlertActionRunning = true;

            try {
              Navigator.of(context).pop();

              if (alert is LocationAlert &&
                  alert.code == locationServiceErrorCode) {
                await Geolocator.openLocationSettings();
                return;
              }

              final permission = await Geolocator.checkPermission();

              if (permission == LocationPermission.denied ||
                  permission == LocationPermission.unableToDetermine) {
                final requestedPermission =
                    await Geolocator.requestPermission();

                if (!context.mounted) return;

                if (requestedPermission == LocationPermission.deniedForever) {
                  await Geolocator.openAppSettings();
                  return;
                }

                if (requestedPermission == LocationPermission.whileInUse ||
                    requestedPermission == LocationPermission.always) {
                  await onRefresh?.call();
                }
                return;
              }

              if (permission == LocationPermission.deniedForever) {
                await Geolocator.openAppSettings();
                return;
              }

              await onRefresh?.call();
            } finally {
              _isLocationAlertActionRunning = false;
              if (!actionCompleter.isCompleted) {
                actionCompleter.complete();
              }
            }
          },
        ),
      ).whenComplete(() {
        _isLocationAlertDialogShowing = false;
        if (!_isLocationAlertActionRunning && !actionCompleter.isCompleted) {
          actionCompleter.complete();
        }
      });

      await actionCompleter.future;
    } else if (alert is LocationAlertFakeGps) {
      if (_isLocationAlertDialogShowing || _isLocationAlertActionRunning) {
        return;
      }

      _isLocationAlertDialogShowing = true;
      await showCustomDialog<void>(
        context: context,
        barrierDismissible: false,
        dialog: CustomDialog(
          title: title ?? 'Lokasi Palsu Terdeteksi',
          barrierDismissible: false,
          icon: Icon(
            Icons.location_on,
            size: 48,
            color: iconColor ?? ColorPalette.kBlack,
          ),
          description: message,
          titleColor: titleColor,
          descriptionColor: messageColor,
          backgroundColor: backgroundColor,
          onPrimaryPressed: () async {
            Navigator.of(context).pop();
            await onRefresh?.call();
          },
        ),
      ).then((_) => _isLocationAlertDialogShowing = false);
    } else if (alert is NotificationAlert) {
      await showCustomDialog<void>(
        context: context,
        barrierDismissible: false,
        dialog: CustomDialog(
          title: title ?? 'Izinkan Notifikasi',
          barrierDismissible: false,
          icon: Icon(
            Icons.notifications,
            size: 48,
            color: iconColor ?? ColorPalette.kBlack,
          ),
          description: message,
          titleColor: titleColor,
          descriptionColor: messageColor,
          backgroundColor: backgroundColor,
          primaryButtonText: 'Continue',
          onPrimaryPressed: () async {
            Navigator.of(context).pop();
            await onRefresh?.call();
          },
        ),
      ).then((_) => _isLocationAlertDialogShowing = false);
    }
  }
}
