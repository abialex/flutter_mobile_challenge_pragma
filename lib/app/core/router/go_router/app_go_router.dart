import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/app_back_mobil_handler.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/cat/cat_detail_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/cat/cat_search_list_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/leading/leading_page.dart';
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
      path: AppRoutes.leading.path,
      name: AppRoutes.leading.name,
      pageBuilder: (context, state) => _fadeTransition(AppBackMobilHandler(child: const LeadingPage())),
    ),
    GoRoute(
      path: AppRoutes.catSearchList.path,
      name: AppRoutes.catSearchList.name,
      pageBuilder: (context, state) {
        final search = state.extra as String?;
        return _fadeTransition(AppBackMobilHandler(child: CatSearchListPage(searchQuery: search)));
      },
    ),
    GoRoute(
      path: AppRoutes.catDetail.path,
      name: AppRoutes.catDetail.name,
      pageBuilder: (context, state) {
        final cat = state.extra as CatItemListDataModel;
        return _fadeTransition(AppBackMobilHandler(child: CatDetailPage(catDetail: cat)));
      },
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
    transitionDuration: const Duration(milliseconds: 400),
  );
}
