import 'package:animations/src/utils/colors.dart';
import 'package:flutter/material.dart';

class DecorationsApp {
  static BoxDecoration buttonDecoraration = BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    gradient: LinearGradient(
      colors: [
        ColorsApp.primary,
        ColorsApp.secondary,
        ColorsApp.greyW,
      ],
      end: Alignment.centerRight,
      begin: Alignment.centerLeft,
      stops: const [
        0.5,
        1.0,
        0.5,
      ],
      tileMode: TileMode.clamp,
    ),
  );
}
