import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';

BoxDecoration appBoxShadow({
  Color color = AppColors.primaryElement,
  double radius = 15.0,
  double sR = 1,
  double bR = 2,
  Border? border,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: border,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: const Offset(0, 1),
      ),
    ],
  );
}
