import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_pages_routes.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // kích thước thiết kế tham chiếu
      designSize: const Size(375, 812),
      // điều chỉnh text size
      minTextAdapt: true,
      // kich thước thiết kế
      splitScreenMode: true,

      builder: (context, child) =>
          MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
         // home:   WelcomeScreen(),
          onGenerateRoute: (settings)=> AppPages.generateRouteSettings(settings) ,
        ),

    );
  }
}
