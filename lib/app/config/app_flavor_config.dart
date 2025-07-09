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
        return 'http://localhost:3000/api';
      case Flavor.STG:
        return 'http://localhost:3000/api';
      case Flavor.PROD:
        return 'http://localhost:3000/api';
    }
  }
}
