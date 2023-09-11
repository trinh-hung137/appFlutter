import 'package:vncare_qlhk/screens/account/changePassword/data/model/ChangePasswordModel.dart';

abstract class ChangePasswordRepository {
  Future<ErrorMessageChangePassword> changepassword(
      String token, String oldpassword, String newpassword);
}
