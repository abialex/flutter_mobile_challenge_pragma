import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_dialog_widget.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/widget/app_const_text.dart';

class AppBackMobilHandler extends StatelessWidget {
  final Widget child;

  const AppBackMobilHandler({required this.child, super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,

      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (kDebugMode) {
          print('🔙 BackButtonHandler activado!');
        } // Debug
        // Verificar si hay páginas anteriores en GoRouter
        if (context.canPop()) {
          if (kDebugMode) {
            print('⬅️ GoRouter navegando hacia atrás...');
          } // Debug
          context.pop();
        } else {
          if (kDebugMode) {
            print('🚪 GoRouter mostrando diálogo de salida...');
          } // Debug
          // Si no hay páginas anteriores, mostrar diálogo de salida
          bool shouldExit =
              await showDialog<bool>(
                context: context,
                builder:
                    (context) => AppDialogWidget(
                      title: '¿Salir de la app?',
                      message: '¿Estás seguro de que quieres salir?',
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: AppConstText.mediumText(text: 'Cancelar'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: AppConstText.mediumText(text: 'Salir'),
                        ),
                      ],
                    ),
              ) ??
              false;

          if (shouldExit) {
            SystemNavigator.pop(); // Cerrar la app
          }
        }
      },
      child: child,
    );
  }
}
