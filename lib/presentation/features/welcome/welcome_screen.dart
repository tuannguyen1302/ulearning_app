import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'provider/welcome_state.dart';
import 'widgets/app_onboarding_page.dart';


// final indexProvider = StateProvider<int>((ref) => 0);

class WelcomeScreen extends ConsumerWidget {
  WelcomeScreen({super.key});

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(welcomeStateProvider);
    final refindex = ref.read(welcomeStateProvider.notifier);
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 30.h),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                onPageChanged: (value) {
                  refindex.changePage(value);
                },
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  appOnboardingPage(
                    _pageController,
                    imagePath: 'assets/images/reading.png',
                    title: 'First see Learning',
                    subTitle:
                    'Forget about of paper all knowledge in one learning ',
                    index: 1,
                    context: context,
                  ),
                  appOnboardingPage(
                    _pageController,
                    imagePath: 'assets/images/man.png',
                    title: 'First see Learning',
                    subTitle:
                    'Forget about of paper all knowledge in one learning ',
                    index: 2,
                    context: context,
                  ),
                  appOnboardingPage(
                    _pageController,
                    imagePath: 'assets/images/boy.png',
                    title: 'First see Learning',
                    subTitle:
                    'Forget about of paper all knowledge in one learning ',
                    index: 3,
                    context: context,
                  ),
                ],
              ),
              Positioned(

                bottom: 50,
                child: DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  position: index,

                  decorator: DotsDecorator(
                    size: const Size.square(9),
                    activeSize: const Size(
                      24,
                      8,
                    ),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

