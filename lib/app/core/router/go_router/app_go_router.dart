import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/app_back_mobil_handler.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/home/home_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoutes.splash.path,
  routes: [
    GoRoute(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      pageBuilder: (context, state) => _fadeTransition(AppBackMobilHandler(child: const SplashPage())),
    ),
    GoRoute(
      path: AppRoutes.login.path,
      name: AppRoutes.login.name,
      pageBuilder: (context, state) => _fadeTransition(AppBackMobilHandler(child: const HomePage())),
    ),

    // ShellRoute(
    //   builder: (context, state, child) {
    //     return AppBackMobilHandler(child: Scaffold(drawer: const AppDrawer(), appBar: AppBar(), body: child));
    //   },
    //   routes: [
    //     GoRoute(
    //       path: AppRoutes.home.path,
    //       name: AppRoutes.home.name,
    //       pageBuilder: (context, state) {
    //         final userId = state.extra;
    //         print('🚀 Nueva ruta empujada: ${userId}');
    //         return _fadeTransition(AppBackMobilHandler(child: const HomePage()));
    //       },
    //     ),
    //     GoRoute(
    //       path: AppRoutes.profile.path,
    //       name: AppRoutes.profile.name,
    //       pageBuilder:
    //           (context, state) => _fadeTransition(
    //             AppBackMobilHandler(child: const Scaffold(body: Center(child: Text('Profile Page')))),
    //           ),
    //     ),
    //     GoRoute(
    //       path: AppRoutes.settings.path,
    //       name: AppRoutes.settings.name,
    //       pageBuilder:
    //           (context, state) => _fadeTransition(
    //             AppBackMobilHandler(
    //               key: Key('settings'),
    //               child: const Scaffold(body: Center(child: Text('Settings Page'))),
    //             ),
    //           ),
    //     ),
    //   ],
    // ),
  ],
  redirect: (context, state) => null,
  //errorBuilder: (context, state) => const Page404(),
);

CustomTransitionPage _fadeTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 1000),
  );
}
