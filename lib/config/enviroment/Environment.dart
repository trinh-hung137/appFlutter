import 'package:vncare_qlhk/config/enviroment/BaseConfig.dart';
import 'package:vncare_qlhk/config/enviroment/ProdConfig.dart';
import 'package:vncare_qlhk/config/enviroment/StagingConfig.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String STAGING = 'STAGING';
  static const String PROD = 'PROD';

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.PROD:
        return ProdConfig();
      case Environment.STAGING:
        return StagingConfig();
      default:
        return StagingConfig();
    }
  }
}
