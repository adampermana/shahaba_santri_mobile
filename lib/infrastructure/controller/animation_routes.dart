import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A custom page transition that matches Figma designs:
/// - Move In: right to left with ease-in-out
/// - Move Out: left to right with ease-in-out
class AnimTransitionRoutePage<T> extends CustomTransitionPage<T> {
  const AnimTransitionRoutePage({
    required super.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.maintainState = true,
    super.fullscreenDialog = false,
    super.opaque = true,
    super.transitionDuration = const Duration(milliseconds: 500),
    super.reverseTransitionDuration = const Duration(milliseconds: 500),
  }) : super(transitionsBuilder: _buildTransitions);

  static Widget _buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0), // masuk dari kanan
        end: Offset.zero,
      ).animate(curvedAnimation),
      child: child,
    );
  }
}

/// A vertical variation of the Figma-style transition (top to bottom)
class AnimTransitionVerticalPage<T> extends CustomTransitionPage<T> {
  /// Constructor for the vertical Figma-style transition page
  const AnimTransitionVerticalPage({
    required super.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.maintainState = true,
    super.fullscreenDialog = false,
    super.opaque = true,
    super.transitionDuration = const Duration(milliseconds: 300),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
  }) : super(transitionsBuilder: _buildTransitions);

  /// Builds the vertical Figma-style transition animation
  static Widget _buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Current page animation (for entering and exiting)
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );

    // Secondary page animation (previous page)
    final secondaryCurvedAnimation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );

    return Stack(
      children: [
        // Previous page sliding out from bottom to top
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(0, -1), // Exit to the top
          ).animate(secondaryCurvedAnimation),
          child: Container(color: Theme.of(context).scaffoldBackgroundColor),
        ),

        // Current page sliding in from top to bottom
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1), // Enter from the bottom
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        ),
      ],
    );
  }
}

/// A fade-enhanced version of the Figma-style transition
class FigmaStyleFadeTransitionPage<T> extends CustomTransitionPage<T> {
  /// Constructor for the fade-enhanced Figma-style transition page
  const FigmaStyleFadeTransitionPage({
    required super.child,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    super.barrierDismissible,
    super.barrierColor,
    super.barrierLabel,
    super.maintainState = true,
    super.fullscreenDialog = false,
    super.opaque = true,
    super.transitionDuration = const Duration(milliseconds: 300),
    super.reverseTransitionDuration = const Duration(milliseconds: 300),
  }) : super(transitionsBuilder: _buildTransitions);

  /// Builds the fade-enhanced Figma-style transition animation
  static Widget _buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Current page animation (for entering and exiting)
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );

    // Secondary page animation (previous page)
    final secondaryCurvedAnimation = CurvedAnimation(
      parent: secondaryAnimation,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeInOut,
    );

    return Stack(
      children: [
        // Previous page fading and sliding out from left to right
        FadeTransition(
          opacity: Tween<double>(
            begin: 1,
            end: 0,
          ).animate(secondaryCurvedAnimation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.3, 0), // Exit to the right (partial)
            ).animate(secondaryCurvedAnimation),
            child: Container(color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),

        // Current page fading and sliding in from right to left
        FadeTransition(
          opacity: curvedAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0), // Enter from the right
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          ),
        ),
      ],
    );
  }
}
