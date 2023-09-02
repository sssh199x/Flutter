import 'package:flutter/material.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget widget;
  BouncyPageRoute({required this.widget})
      : super(
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.bounceOut);
            return ScaleTransition(
              //another type FadeTransition
              alignment: Alignment.center,
              filterQuality: FilterQuality.high,
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
        );
}
