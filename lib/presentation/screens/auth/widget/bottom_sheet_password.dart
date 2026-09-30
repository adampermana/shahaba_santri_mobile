import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sahaba_mobile/infrastructure/enum/enum.dart';
import 'package:sahaba_mobile/presentation/app/resources/color_palette.dart';
import 'package:sahaba_mobile/presentation/app/resources/icons.dart';
import 'package:sahaba_mobile/presentation/widgets/custom_textfield.dart';
import 'package:sahaba_mobile/presentation/widgets/submit_button_styles.dart';

class BottomSheetPassword extends StatefulWidget {
  const BottomSheetPassword({
    required this.email,
    super.key,
    this.onKonfirmasi,
    this.onLupaPassword,
  });

  final String email;
  final ValueChanged<String>? onKonfirmasi;
  final VoidCallback? onLupaPassword;

  /// Show bottom sheet dari luar.
  static Future<void> show(
    BuildContext context, {
    required String email,
    ValueChanged<String>? onKonfirmasi,
    VoidCallback? onLupaPassword,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BottomSheetPassword(
          email: email,
          onKonfirmasi: onKonfirmasi,
          onLupaPassword: onLupaPassword,
        ),
      ),
    );
  }

  @override
  State<BottomSheetPassword> createState() => _BottomSheetPasswordState();
}

class _BottomSheetPasswordState extends State<BottomSheetPassword> {
  final _passwordController = TextEditingController();
  bool get isComplete => _passwordController.text.trim().length >= 4;

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _passwordController
      ..removeListener(_onPasswordChanged)
      ..dispose();
    super.dispose();
  }

  void _onKonfirmasi() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isLoading = true);
    widget.onKonfirmasi?.call(_passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorPalette.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Title
            const Center(
              child: Text(
                'Masukin kata sandi kamu',
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: ColorPalette.kWhite,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Label row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kata sandi',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: ColorPalette.inverseSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.onLupaPassword,
                      child: const Text(
                        'Lupa sandinya?',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xFF00C6BF),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Input password
                CustomPasswordFormField(
                  controller: _passwordController,
                  hintText: 'Ketik kata sandimu di sini',
                  fillColor: const Color(0x1FFFFFFF),
                  useBorder: true,
                  colorBorder: const Color(0x29E8E8E8),
                  focusedBorderColor: ColorPalette.primaryColor,
                  borderRadius: 12,
                  textStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ColorPalette.kWhite,
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Satoshi',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ColorPalette.contentDisabled,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 16),
                    child: SvgPicture.asset(
                      AppIcons.iconLock,
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        ColorPalette.contentDisabled,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  visiblePasswordIcon: Icons.visibility_outlined,
                  invisiblePasswordIcon: Icons.visibility_off_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kata sandi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Tombol Konfirmasi
            SubmitButtonStylesWidget(
              style: SubmitButtonStyle.elevated,
              primaryColor: isComplete
                  ? ColorPalette.primaryColor
                  : ColorPalette.contentDisabled,
              textButton: 'Konfirmasi',
              height: 48,
              radius: 9999,
              isLoading: _isLoading,
              isActive: isComplete,
              textStyle: const TextStyle(
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: ColorPalette.kWhite,
              ),
              onPressed: _onKonfirmasi,
            ),

            // Safe area bottom
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }
}
