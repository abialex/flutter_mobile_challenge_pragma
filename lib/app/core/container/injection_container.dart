import 'package:dio/dio.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/app_flavor_config.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/keyboard_visibility_listener/keyboard_visibility_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/lifecycle_listener/app_lifecycle_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';

// GetIt getItApp = GetIt.instance;

class AppDependencyInjection {
  Future<void> init() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppFlavorConfig.urlApp,
        contentType: 'application/json',
        receiveTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
        // validateStatus: (status) => true,
      ),
    );

    getItApp.registerLazySingleton<Dio>(() => dio);

    // final sharedPreferences = await SharedPreferences.getInstance();
    // getItApp.registerLazySingleton(() => sharedPreferences);

    getItApp.registerSingleton<KeyboardVisibilityCubit>(KeyboardVisibilityCubit());
    getItApp.registerSingleton<AppLifecycleCubit>(AppLifecycleCubit());
  }
}
