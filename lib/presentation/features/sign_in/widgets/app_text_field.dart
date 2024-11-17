import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utilities/app_colors.dart';
import '../../widget/text_widget.dart';

Widget appTextField({
  required String text,
  required String iconName,
  required String titleField,
  bool obscureText = false,
  void Function(String value)? func,
  String imagePath = '',
}) {
  return Container(
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textSizeNomal(
          text: text,
          textSize: 14,
          color: AppColors.primaryThreeElementText,
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: 325.w,
          height: 50,
          decoration: appBoxDecoration(),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                child: appImage(imagePath: iconName),
              ),
              SizedBox(
                width: 280.w,
                height: 50.h,
                child: TextField(
                  onChanged: (value) => func!(value),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: titleField,
                    hintStyle: const TextStyle(
                      color: AppColors.primaryFourElementText,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  maxLines: 1,
                  autocorrect: false,
                  obscureText: obscureText,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

BoxDecoration appBoxDecoration({
  Color color = AppColors.primaryBackground,
  double radius = 15.0,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: AppColors.primarySecondaryElementText),
  );
}

Widget appImage({
  required String imagePath,
  double width = 16,
  double height = 16,
}) {
  return Image.asset(
    imagePath.isEmpty ? 'assets/icons/user.png' : imagePath,
    width: width.w,
    height: height.h,
  );
}

Widget textUnderline({String text = 'd'}) {
  return GestureDetector(
    onTap: () {
      //print('ontap');
    },
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.sp,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}
