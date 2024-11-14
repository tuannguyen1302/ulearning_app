import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../constants/router.dart';
import '../../../presentation/features/welcome/welcome_screen.dart';

part 'go_router_provider.g.dart';
@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref ){
  return GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: RouterPaths.root ,
          builder: (context, state) {
            return  WelcomeScreen();
          } ,
        ),
      ],
  );
}