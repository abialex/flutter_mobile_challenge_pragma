import 'package:flutter/material.dart';

/// Observador personalizado para monitorear la navegación
class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('🚀 Nueva ruta empujada: ${route.settings.name}');
    print('⬅️ Ruta anterior: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
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
