import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/constants.dart';
import '../../../../global.dart';
import '../../../../utilities/app_colors.dart';
import '../../widget/app_box_shadow.dart';
import '../../widget/text_widget.dart';
Widget appOnboardingPage(
  PageController pageController, {
  required String imagePath,
  required String title,
  required String subTitle,
  required int index,
  required BuildContext context,
}) {
  return Column(
    children: [
      Image.asset(
        imagePath,
        fit: BoxFit.fitWidth,
      ),
      Container(
        margin:  EdgeInsets.only(top: 15.h),
        child: textSizeNomal(
          text: title,
          textSize: 24,
          color: AppColors.primaryText,
        ),
      ),
      Container(
        margin:  EdgeInsets.only(top: 15.h),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: textSizeNomal(
          text: subTitle,
          textSize: 14,
          color: AppColors.primarySecondaryElementText,
        ),
      ),
      _nextButton(index, pageController, context),
    ],
  );
}

Widget _nextButton(int index, PageController controller, BuildContext context) {
  final title = (index < 3) ? 'Next' : 'Get Started';
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: const Duration(microseconds: 500),
          curve: Curves.easeInOutQuad,
        );
      } else {
        Global.storageService.setBool(Constants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const SignInScreen(),
        //   ),
        // );
        Navigator.pushNamed(context, '/signIn');
      }
    },
    child: Container(
      width: 300,
      height: 50,
      margin: const EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
        child: textSizeNomal(
          text: title,
          textSize: 20,
          color: AppColors.primaryElementText,
        ),
      ),
    ),
  );
}
