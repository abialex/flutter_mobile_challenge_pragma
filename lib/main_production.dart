import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobile_challenge_pragma/app/config/app_flavor_config.dart';
import 'package:flutter_mobile_challenge_pragma/app/main.dart';
import 'package:flutter_mobile_challenge_pragma/boostrap.dart';

void main() async {
  await dotenv.load(fileName: 'assets/env/.env'); // Load environment variables from .env.example file
  AppFlavorConfig.appFlavor = Flavor.PROD;
  bootstrap(() => const Main());
}
