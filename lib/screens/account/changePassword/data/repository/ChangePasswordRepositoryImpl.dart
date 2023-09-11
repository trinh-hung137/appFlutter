import 'package:vncare_qlhk/screens/account/changePassword/data/remote/ChangePasswordApi.dart';
import 'package:vncare_qlhk/screens/account/changePassword/data/repository/ChangePasswordRepository.dart';
import 'package:vncare_qlhk/screens/account/changePassword/data/model/ChangePasswordModel.dart';

class ChangePasswordRepositoryImpl implements ChangePasswordRepository {
  late ChangePasswordApi changePasswordApi;

  ChangePasswordRepositoryImpl(ChangePasswordApi changePasswordApi) {
    this.changePasswordApi = changePasswordApi;
  }

  @override
  Future<ErrorMessageChangePassword> changepassword(
      String token, String oldpassword, String newpassword) {
    return changePasswordApi.changepassword(token, oldpassword, newpassword);
  }
}
