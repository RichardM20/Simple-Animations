import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BetwenAnimationControled extends StatelessWidget {
  BetwenAnimationControled({
    super.key,
    required this.childPass,
    required this.direction,
    this.duration,
  });
  final Widget childPass;
  final int? duration;
  final String direction;
  //
  double dx = 0.0;
  double dy = 0.0;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: Duration(milliseconds: duration ?? 250),
      builder: (context, value, child) {
        switch (direction) {
          case 'left':
            dx = -400 * value;
            break;
          case 'right':
            dx = 400 * value;
            break;
          case 'up':
            dy = -400 * value;
            break;
          case 'down':
            dy = 400 * value;
            break;
        }
        return Transform.translate(
          offset: Offset(dx, dy),
          child: childPass,
        );
      },
    );
  }
}
