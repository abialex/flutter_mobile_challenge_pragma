// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation, use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/keyboard_visibility_listener/keyboard_visibility_listener.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/lifecycle_listener/app_lifecycle_listener.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/consts/app_const_gif.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/cubit/mode_theme_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/router/go_router/app_go_router.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_listener.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/theme/app_theme.dart';

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ModeThemeCubit>().state ? ThemeMode.dark : ThemeMode.light,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.unknown,
        },
      ),
      title: 'Catbreeds',
      builder: (_, child) {
        return AppLifecycleHandler(
          child: AppKeyboardVisibilityListener(
            child: AppHttpErrorListener(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
                child: Stack(children: [child!]),
              ),
            ),
          ),
        );
      },
    );
  }
}
