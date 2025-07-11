import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_state.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_go_router.dart'; // Para rootNavigatorKey
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_dialog_widget.dart';

class AppHttpErrorListener extends StatelessWidget {
  final Widget child;

  const AppHttpErrorListener({super.key, required this.child});

  @override
  Widget build(BuildContext _) {
    return BlocListener<HttpErrorBloc, HttpErrorState>(
      listener: (_, state) {
        final navigatorContext = rootNavigatorKey.currentContext;
        if (navigatorContext == null) {
          return;
        }
        state.mapOrNull(
          unauthorized:
              (s) => showDialog(
                context: navigatorContext,
                builder: (___) => AppDialogWidget(title: 'No autorizado', message: s.mensaje),
              ),
          badRequest:
              (s) => showDialog(
                context: navigatorContext,
                builder: (___) => AppDialogWidget(title: 'Petición incorrecta', message: s.mensaje),
              ),
          notFound:
              (s) => showDialog(
                context: navigatorContext,
                builder: (___) => AppDialogWidget(title: 'No encontrado', message: s.mensaje),
              ),
          failure:
              (s) => showDialog(
                context: navigatorContext,
                builder: (___) => AppDialogWidget(title: 'Error', message: s.error),
              ),
          withoutConnection:
              (_) => showDialog(
                context: navigatorContext,
                builder: (___) => const AppDialogWidget(title: 'Sin conexión', message: 'No hay conexión a internet'),
              ),
          internalServerError:
              (s) => showDialog(
                context: navigatorContext,
                builder: (___) => AppDialogWidget(title: 'Error del servidor', message: s.mensaje),
              ),
          manyRequest:
              (_) => showDialog(
                context: navigatorContext,
                builder: (___) {
                  return const AppDialogWidget(title: 'Demasiadas peticiones', message: 'Intenta más tarde');
                },
              ),
          unavailableService:
              (_) => showDialog(
                context: navigatorContext,
                builder:
                    (___) => const AppDialogWidget(
                      title: 'Servicio no disponible',
                      message: 'El servicio no está disponible',
                    ),
              ),
          otherError:
              (_) => showDialog(
                context: navigatorContext,
                builder:
                    (___) =>
                        const AppDialogWidget(title: 'Error desconocido', message: 'Ha ocurrido un error inesperado'),
              ),
          webviewError:
              (s) => showDialog(
                context: navigatorContext,
                builder: (___) => AppDialogWidget(title: 'Error en la página embebida', message: s.error),
              ),
        );
      },
      child: child,
    );
  }
}
