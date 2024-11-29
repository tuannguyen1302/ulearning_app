import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utilities/app_colors.dart';
import '../../global_loader/global_loader.dart';
import '../sign_up/sign_up_screen.dart';
import '../widget/app_text_field.dart';
import '../widget/build_app_bar.dart';
import '../widget/text_widget.dart';
import 'provider/sign_in_viewmodel.dart';
import 'widgets/button_widget.dart';
import 'widgets/third_party_login.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool _showPassword = false; // Trạng thái hiển thị mật khẩu
  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInViewmodelProvider(context));
    final readSignInProvider = ref.read(signInViewmodelProvider(context).notifier);
    final loader = ref.watch(globalLoaderProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: 'Sign In', automaticallyImplyLeading: false),
      body: SafeArea(
        child: loader == false
            ? SingleChildScrollView(
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
                      func: (value) =>
                          readSignInProvider.onUserEmailChanged(value),
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
                      func: (value) =>
                          readSignInProvider.onUserPasswordChanged(value),

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
                    //button signing
                    Center(
                      child: buttonWidget(
                        text: 'Sign In',
                        func: () {
                          readSignInProvider.handleSignIn();
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
              )
            : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  color: AppColors.primaryText,
                ),
              ),
      ),
    );
  }
}
