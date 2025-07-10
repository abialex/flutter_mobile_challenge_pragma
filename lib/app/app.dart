// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/keyboard_visibility_listener/keyboard_visibility_listener.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/lifecycle_listener/app_lifecycle_listener.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_gif.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isPrecached = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isPrecached) {
      precacheImage(AssetImage(AppConstGif.loading_cat), context);
      _isPrecached = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final stateDarkMode = context.watch<DarkModeCubit>().state;
    return MaterialApp.router(
      locale: const Locale('es'),
      supportedLocales: const [Locale('en', ''), Locale('es', '')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
        },
      ),
      title: 'ERP',
      builder: (context, child) {
        return AppLifecycleHandler(
          child: AppKeyboardVisibilityListener(
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.1)),
              child: Stack(
                children: [
                  child!,
                  // const PdfVistaPreviaDialog(),
                  // BlocBuilder<LoaderCubit, bool>(
                  //   builder: (context, state) {
                  //     if (state) {
                  //       return const CustomLoader();
                  //     } else {
                  //       return const SizedBox.shrink();
                  //     }
                  //   },
                  // ),
                  // BlocBuilder<DialogAlertCubit, DialogAlertState>(
                  //   builder: (context, state) {
                  //     if (state.show) {
                  //       return const DialogAlertPage();
                  //     } else {
                  //       return const SizedBox.shrink();
                  //     }
                  //   },
                  // ),
                  // MultiBlocListener(
                  //   listeners: [

                  //     BlocListener<SunatConsultaBloc, SunatConsultaState>(
                  //       listener: (context, state) {
                  //         // final loader = context.read<LoaderCubit>();
                  //         final dialog = context.read<DialogAlertCubit>();
                  //         state.mapOrNull(
                  //           failure: (value) {
                  //             dialog.showErrorAlert(texto: value.error);
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ],
                  //   child: Container(),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
