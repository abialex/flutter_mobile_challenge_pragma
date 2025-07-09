import 'package:flutter_mobile_challenge_pragma/app/config/app_flavor_config.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';
import 'package:flutter_mobile_challenge_pragma/boostrap.dart';

void main() {
  AppFlavorConfig.appFlavor = Flavor.PROD;
  bootstrap(() => const Main());
}
