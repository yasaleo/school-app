

import 'package:flutter/material.dart';

class CustomPageTransition {
  Route customFadeRoute({required Widget page}) {
    return PageRouteBuilder(
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  Route customScaleRoute({required Widget page}) {
    return PageRouteBuilder(
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 800),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final scaleAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.fastLinearToSlowEaseIn,
        );
        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },
    );
  }
}
