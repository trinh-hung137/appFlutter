import 'package:vncare_qlhk/config/enviroment/BaseConfig.dart';

class ProdConfig implements BaseConfig {
  String get apiHost => "apidatlichkham.vncare.vn";

  bool get reportErrors => true;

  bool get trackEvents => true;

  bool get useHttps => true;
}
