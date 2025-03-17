import 'package:flutter/material.dart';

import '../global.dart';
import '../presentation/features/home/home_screen.dart';
import '../presentation/features/sign_in/sign_in_screen.dart';
import '../presentation/features/sign_up/sign_up_screen.dart';
import '../presentation/features/welcome/welcome_screen.dart';
import 'router.dart';

class AppPages {
  static List<RoutesEntity> routes() {
    return [
      RoutesEntity(path: RouterNames.welcome, page: WelcomeScreen()),
      RoutesEntity(path: RouterNames.signIn, page: const SignInScreen()),
      RoutesEntity(path: RouterNames.signUp, page: const SignUpScreen()),
      RoutesEntity(path: RouterNames.home, page: const HomeScreen()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      final result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        final deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.path == RouterNames.welcome && deviceFirstOpen) {
          final isLoggerIn = Global.storageService.isLoggedIn();
          if (isLoggerIn) {
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => const SignInScreen(),
              settings: settings,
            );
          }
        } else {
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }
    return MaterialPageRoute(
      builder: (_) => WelcomeScreen(),
      settings: settings,
    );
  }
}

class RoutesEntity {
  RoutesEntity({required this.path, required this.page});
  String path;
  Widget page;
}
