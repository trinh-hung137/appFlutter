import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:vncare_qlhk/screens/account/changePassword/data/remote/ChangePasswordApiImpl.dart';
import 'package:vncare_qlhk/screens/account/changePassword/data/repository/ChangePasswordRepositoryImpl.dart';
import 'package:vncare_qlhk/screens/account/changePassword/data/model/ChangePasswordModel.dart';

class ViewModelChangePassword {
  var errorMessageSubject = PublishSubject<ErrorMessageChangePassword>();

  Stream<ErrorMessageChangePassword> get errormessagechangepassword =>
      errorMessageSubject.stream;
  ChangePasswordRepositoryImpl changePasswordRepositoryImpl =
      ChangePasswordRepositoryImpl(ChangePasswordApiImpl());

  void changepassword(
      String token, String oldpassword, String newpassword) async {
    try {
      errorMessageSubject = PublishSubject<ErrorMessageChangePassword>();
      errorMessageSubject.sink.add(await changePasswordRepositoryImpl
          .changepassword(token, oldpassword, newpassword));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      errorMessageSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    errorMessageSubject.close();
  }
}
