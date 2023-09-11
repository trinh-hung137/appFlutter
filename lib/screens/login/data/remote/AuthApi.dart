import 'package:vncare_qlhk/screens/login/data/model/Token.dart';
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';

abstract class AuthApi {
  Future<Token> login(String user, String password);
  Future<BaseResponse> revokeDeviceToken(String token);
}
