import 'package:vncare_qlhk/screens/login/data/model/Token.dart';
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';

abstract class AuthRepository {
  Future<Token> login(String user, String pass);
  Future<BaseResponse> revokeDeviceToken(String token);
}
