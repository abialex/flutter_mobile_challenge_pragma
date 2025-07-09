import 'package:flutter_mobile_challenge_pragma/app/config/app_flavor_config.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';
import 'package:flutter_mobile_challenge_pragma/boostrap.dart';

void main() async {
  AppFlavorConfig.appFlavor = Flavor.DEV;
  await bootstrap(() => const Main());
}
