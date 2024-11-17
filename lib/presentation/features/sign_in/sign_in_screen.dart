import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/app_colors.dart';
import '../sign_up/sign_up_screen.dart';
import '../widget/text_widget.dart';
import 'widgets/app_bar_sign_in.dart';
import 'widgets/app_text_field.dart';
import 'widgets/button_widget.dart';
import 'widgets/third_party_login.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarSignIn(title: 'Sign In', automaticallyImplyLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo gg,fb,apple
              thirdPartyLogin(),
              //text
              Center(
                child: textSizeNomal(
                  text: 'Or use your email account login',
                  textSize: 14.sp,
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              // email
              appTextField(
                text: 'Email',
                iconName: 'assets/icons/user.png',
                titleField: 'Enter your email address',
              ),
              SizedBox(
                height: 20.h,
              ),
              // password
              appTextField(
                text: 'Password',
                iconName: 'assets/icons/lock.png',
                titleField: 'Enter your password',
                obscureText: true,
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.only(left: 25.w),
                child: textUnderline(text: 'Forgot password?'),
              ),
              SizedBox(
                height: 100.h,
              ),
              //button signin
              Center(
                child: buttonWidget(
                  text: 'Sign In',
                  func: () {
                    //  print('login');
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: buttonWidget(
                  text: 'Register',
                  isLogin: false,
                  context: context,
                  func: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
