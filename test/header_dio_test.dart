import 'package:flutter_mobile_challenge_pragma/app/config/app_flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobile_challenge_pragma/app/core/container/injection_container.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUpAll(() async {
    AppFlavorConfig.appFlavor = Flavor.DEV; // Set the app flavor for testing
    await dotenv.load(fileName: 'assets/env/.env');
    await AppDependencyInjection().init(GetIt.instance); // ✅ Registro de Dio
  });

  test('Dio should have x-api-key header from interceptor', () async {
    // final getItAppTest = Get;
    final dio = GetIt.instance<Dio>();
    late Map<String, dynamic> headers;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          headers = options.headers;
          handler.resolve(Response(requestOptions: options));
        },
      ),
    );

    await dio.get('/fake');
    expect(headers.containsKey('x-api-key'), isTrue);
    expect(headers['x-api-key'], equals(dotenv.env['API_KEY']));
  });
}
