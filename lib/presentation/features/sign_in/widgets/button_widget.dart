import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilities/app_colors.dart';
import '../../widget/app_box_shadow.dart';
import '../../widget/text_widget.dart';

Widget buttonWidget({
  required String text,
  double width = 325,
  double height = 50,
  bool isLogin = true,
  BuildContext? context,
  void Function()? func,
}) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: width.w,
      height: height.h,
      decoration: appBoxShadow(
        color: isLogin ? AppColors.primaryElement : Colors.white,
        border: Border.all(
          color: AppColors.primaryFourElementText,
        ),
      ),
      child: Center(
        child: textSizeNomal(
          text: text,
          textSize: 20,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
}
