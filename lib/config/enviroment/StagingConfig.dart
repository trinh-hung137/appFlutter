import 'package:vncare_qlhk/config/enviroment/BaseConfig.dart';

class StagingConfig implements BaseConfig {
  String get apiHost => "staging-apidatlichkham.vncare.vn";

  bool get reportErrors => true;

  bool get trackEvents => false;

  bool get useHttps => true;
}
