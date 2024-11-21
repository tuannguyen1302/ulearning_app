import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/app_colors.dart';
import '../../global_loader/global_loader.dart';
import '../widget/app_text_field.dart';
import '../widget/build_app_bar.dart';
import '../widget/text_widget.dart';
import 'provider/signup_viewmodel.dart';
import 'widgets/button_sign_up.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  SignUpViewModel _controller = SignUpViewModel();

  @override
  void initState() {
    _controller = ref.read(signUpViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // final regProvider = ref.watch(signUpViewModelProvider);
    final viewModel = ref.read(signUpViewModelProvider.notifier);
    final loader = ref.watch(globalLoaderProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: 'Sign Up', automaticallyImplyLeading: true),
      body: loader == false
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                      child: textSizeNomal(
                        text: 'Enter your details below & free sign up',
                        textSize: 14.sp,
                        color: AppColors.primaryThreeElementText,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    //Email
                    appTextField(
                      text: 'User name ',
                      iconName: 'assets/icons/user.png',
                      titleField: 'Enter your user name ',
                      func: (value) {
                        viewModel.onUsernameChanged(value);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //Password
                    appTextField(
                      text: 'Email',
                      iconName: 'assets/icons/user.png',
                      titleField: 'Enter your email',
                      func: (value) {
                        viewModel.onEmailChanged(value);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //Password
                    appTextField(
                      text: 'Password',
                      iconName: 'assets/icons/lock.png',
                      titleField: 'Enter your password',
                      obscureText: true,
                      func: (value) {
                        viewModel.onPasswordChanged(value);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //Password
                    appTextField(
                      text: 'Confirm Password',
                      iconName: 'assets/icons/lock.png',
                      titleField: 'Enter your Confirm Password',
                      obscureText: true,
                      func: (value) {
                        viewModel.onRePasswordChanged(value);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: textSizeNomal(
                        textSize: 14.sp,
                        text:
                            'By creating an account you have ta agree with\nout terms and conditions.',
                        color: AppColors.primaryFourElementText,
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    // button login
                    Center(
                      child: buttonSignUp(
                        isLogin: true,
                        text: 'Register ',
                        context: context,
                        func: () {
                          //print("========${state.value?.userName}");
                          viewModel.handleSignUp(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
                color: AppColors.primaryText,
              ),
            ),
    );
  }
}
