import 'package:flutter/material.dart';

class LoadingOverlay {
  LoadingOverlay._();

  static OverlayEntry? _entry;
  static bool _isShown = false;

  /// Tampilkan overlay loading.
  static void show(
    BuildContext context, {
    bool dismissible = false,
    String? message,
    double barrierOpacity = 0.5,
    Widget? content,
  }) {
    if (_isShown) return;

    final overlay = Overlay.of(context, rootOverlay: true);

    _entry = OverlayEntry(
      builder: (_) => _LoadingBackdrop(
        dismissible: dismissible,
        message: message,
        barrierOpacity: barrierOpacity,
        content: content,
      ),
    );

    overlay.insert(_entry!);
    _isShown = true;
  }

  /// Sembunyikan overlay loading.
  static void hide() {
    if (!_isShown) return;
    _entry?.remove();
    _entry = null;
    _isShown = false;
  }
}

class _LoadingBackdrop extends StatefulWidget {
  const _LoadingBackdrop({
    required this.dismissible,
    required this.barrierOpacity,
    this.message,
    this.content,
  });

  final bool dismissible;
  final double barrierOpacity;
  final String? message;
  final Widget? content;

  @override
  State<_LoadingBackdrop> createState() => _LoadingBackdropState();
}

class _LoadingBackdropState extends State<_LoadingBackdrop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ac = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 150),
  )..forward();
  late final Animation<double> _fade = CurvedAnimation(
    parent: _ac,
    curve: Curves.easeOut,
  );

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final barrier = ModalBarrier(
      dismissible: widget.dismissible,
      color: Colors.black.withValues(alpha: widget.barrierOpacity),
    );

    final message = widget.message?.trim();
    final hasMessage = message != null && message.isNotEmpty;

    final content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.content ?? const CircularProgressIndicator(),
          if (hasMessage) ...[
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );

    final body = PopScope(
      canPop: widget.dismissible, // back button hanya kalau dismissible
      child: Stack(children: [barrier, content]),
    );

    return FadeTransition(opacity: _fade, child: body);
  }
}
