import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/app_flavor_config.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/keyboard_visibility_listener/keyboard_visibility_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/lifecycle_listener/app_lifecycle_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/widget/http_error_listener/http_error_bloc/http_error_bloc.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/cubit/can_pop_cubit.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/interceptor/dio_header_interceptor.dart';
import 'package:flutter_mobile_challenge_pragma/app/data/repository/cat_repository.dart';
import 'package:flutter_mobile_challenge_pragma/app/data/services/cat_service.dart';
import 'package:flutter_mobile_challenge_pragma/app/domain/repository/i_cat_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

// GetIt getItApp = GetIt.instance;

class AppDependencyInjection {
  Future<void> init(GetIt getItApp) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppFlavorConfig.urlApp,
        contentType: 'application/json',
        receiveTimeout: const Duration(seconds: 15),
        connectTimeout: const Duration(seconds: 15),
        // validateStatus: (status) => true,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        TalkerDioLogger(settings: const TalkerDioLoggerSettings(printRequestHeaders: true, printResponseHeaders: true)),
      );
    }

    getItApp.registerLazySingleton<Dio>(() => dio);

    // Service
    getItApp.registerLazySingleton<CatService>(CatService.new);

    // Repository
    getItApp.registerLazySingleton<ICatRepository>(CatRepository.new);

    // blocs-cubits
    getItApp.registerSingleton<KeyboardVisibilityCubit>(KeyboardVisibilityCubit());
    getItApp.registerSingleton<AppLifecycleCubit>(AppLifecycleCubit());
    getItApp.registerSingleton<CanPopCubit>(CanPopCubit());
    getItApp.registerSingleton<HttpErrorBloc>(HttpErrorBloc());

    dio.interceptors.add(DioHeaderInterceptor());
  }
}
