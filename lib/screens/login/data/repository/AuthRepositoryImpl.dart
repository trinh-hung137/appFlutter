import 'package:vncare_qlhk/screens/login/data/model/Token.dart';
import 'package:vncare_qlhk/screens/login/data/remote/AuthApi.dart';
import 'package:vncare_qlhk/screens/login/data/repository/AuthRepository.dart';
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';

class AuthRepositoryImpl implements AuthRepository {
  late AuthApi authApi;

  AuthRepositoryImpl(AuthApi authApi) {
    this.authApi = authApi;
  }

  @override
  Future<Token> login(String user, String pass) {
    return authApi.login(user, pass);
  }

  @override
  Future<BaseResponse> revokeDeviceToken(String token) {
    return authApi.revokeDeviceToken(token);
  }
}
