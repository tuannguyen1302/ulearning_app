// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../../constants/router.dart';
// import '../../../presentation/features/home/home_screen.dart';
// import '../../../presentation/features/sign_in/sign_in_screen.dart';
// import '../../../presentation/features/welcome/welcome_screen.dart';
//
// part 'go_router_provider.g.dart';
//
// @Riverpod(keepAlive: true)
// GoRouter goRouter(Ref ref) {
//   return GoRouter(
//     routes: <GoRoute>[
//       GoRoute(
//         path: RouterPaths.root,
//         builder: (context, state) {
//           return WelcomeScreen();
//         },
//         routes: <GoRoute>[
//           GoRoute(
//             path: RouterPaths.signIn,
//             name: RouterNames.signIn,
//             builder: (context, state) {
//               return const SignInScreen();
//             },
//           ),
//           GoRoute(
//             path: RouterPaths.signUp,
//             name: RouterNames.signUp,
//             builder: (context, state) {
//               return const SignInScreen();
//             },
//           ),
//           GoRoute(
//             path: RouterPaths.home,
//             name: RouterNames.home,
//             builder: (context, state) {
//               return const HomeScreen();
//             },
//           ),
//         ],
//       ),
//     ],
//   );
// }
