import 'package:flutter/material.dart';

import '../../../utilities/app_colors.dart';
import 'text_widget.dart';

AppBar buildAppbar({
  String title = '',
  bool automaticallyImplyLeading = true,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: automaticallyImplyLeading,
    centerTitle: true,
    title: textSizeNomal(
      text: title,
      textSize: 16,
      color: AppColors.primaryText,
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
        color: AppColors.primaryText,
        height: 0.5,
      ),
    ),
  );
}
