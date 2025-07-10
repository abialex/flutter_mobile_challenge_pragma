import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/cubit/can_pop_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

/// Observador personalizado para monitorear la navegación
class GoRouterObserver extends NavigatorObserver {
  final cubit = getItApp<CanPopCubit>();
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final canGoBack = navigator?.canPop() ?? false;
    cubit.set(canGoBack);
    print('🚀 Nueva ruta empujada: ${route.settings.name}');
    print('⬅️ Ruta anterior: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final canGoBack = navigator?.canPop() ?? false;
    cubit.set(canGoBack);
    print('👈 Ruta eliminada: ${route.settings.name}');
    print('➡️ Volviendo a: ${previousRoute?.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('🗑️ Ruta removida: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('🔄 Ruta reemplazada: ${oldRoute?.settings.name}');
    print('✨ Nueva ruta: ${newRoute?.settings.name}');
  }
}
