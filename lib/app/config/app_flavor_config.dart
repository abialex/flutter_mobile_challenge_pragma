// ignore_for_file: constant_identifier_names

enum Flavor { DEV, STG, PROD }

class AppFlavorConfig {
  static Flavor? appFlavor;

  static String get building {
    return appFlavor.toString();
  }

  static String get urlApp {
    switch (appFlavor!) {
      case Flavor.DEV:
        return 'https://api.thecatapi.com/v1/';
      case Flavor.STG:
        return 'https://api.thecatapi.com/v1/';
      case Flavor.PROD:
        return 'https://api.thecatapi.com/v1/';
    }
  }
}
