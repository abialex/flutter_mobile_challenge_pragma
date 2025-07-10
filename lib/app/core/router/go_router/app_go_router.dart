import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/app_back_mobil_handler.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_router_observer.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_routes_enum.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/models/cat_item_list_data_model.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/cat/cat_detail_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/cat/cat_search_list_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/leading/leading_page.dart';
import 'package:flutter_mobile_challenge_pragma/app/modules/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  // debugLogDiagnostics: true,
  initialLocation: AppRoutes.splash.path,
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      path: AppRoutes.splash.path,
      name: AppRoutes.splash.name,
      pageBuilder: (context, state) => _fadeTransition(state, AppBackMobilHandler(child: const SplashPage())),
    ),
    GoRoute(
      path: AppRoutes.leading.path,
      name: AppRoutes.leading.name,
      pageBuilder: (context, state) => _fadeTransition(state, AppBackMobilHandler(child: const LeadingPage())),
    ),
    GoRoute(
      path: AppRoutes.catSearchList.path,
      name: AppRoutes.catSearchList.name,
      pageBuilder: (context, state) {
        final search = state.extra as String?;
        return _fadeTransition(state, AppBackMobilHandler(child: CatSearchListPage(searchQuery: search)));
      },
    ),
    GoRoute(
      path: AppRoutes.catDetail.path,
      name: AppRoutes.catDetail.name,
      pageBuilder: (context, state) {
        final cat = state.extra as CatItemListDataModel;
        return _fadeTransition(state, AppBackMobilHandler(child: CatDetailPage(catDetail: cat)));
      },
    ),
  ],
  redirect: (context, state) => null,
  //errorBuilder: (context, state) => const Page404(),
);

CustomTransitionPage _fadeTransition(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 400),
    name: state.name,
  );
}
