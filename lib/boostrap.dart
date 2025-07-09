// ignore_for_file: lines_longer_than_80_chars

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/container/injection_container.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

class AppBlocObserver extends BlocObserver {
  AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
  // FirebaseOptions options,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    if (TargetPlatform.android == defaultTargetPlatform) {
      // FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      // PlatformDispatcher.instance.onError = (error, stack) {
      //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      //   return true;
      // };
    }
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async {
      HttpOverrides.global = MyHttpOverrides();
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: 'assets/env/.env'); // Load environment variables from .env.example file

      await AppDependencyInjection().init(getItApp);

      if (TargetPlatform.android == defaultTargetPlatform) {
        // await FirebaseService.init();
      }
      // await SharedPreferencesService.init();
      // await Firebase.initializeApp(options: firebaseOptions);

      //store
      // await AppStoreProvider.instance.initializeStore();

      // FlutterError.onError = (errorDetails) {
      //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // };
      // PlatformDispatcher.instance.onError = (error, stack) {
      //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      //   return true;
      // };

      //runApp(await builder());
      // runApp(InactivityWrapper(child: await builder()));
      runApp(await builder());
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      if (TargetPlatform.android == defaultTargetPlatform) {
        // FirebaseCrashlytics.instance.recordError(error, stackTrace);
      }
    },
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
