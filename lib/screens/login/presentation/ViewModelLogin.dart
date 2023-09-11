import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:vncare_qlhk/screens/login/data/model/Token.dart';
import 'package:vncare_qlhk/screens/login/data/remote/AuthApiImpl.dart';
import 'package:vncare_qlhk/screens/login/data/repository/AuthRepositoryImpl.dart';
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';

class ViewModelLogin {
  var tokenSubject = PublishSubject<Token>();

  Stream<Token> get token => tokenSubject.stream;
  AuthRepositoryImpl authRepositoryImpl = AuthRepositoryImpl(AuthApiImp());

  void login(String user, String pass) async {
    try {
      tokenSubject = PublishSubject<Token>();
      tokenSubject.sink.add(await authRepositoryImpl.login(user, pass));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      tokenSubject.sink.addError(e);
    }
  }

  var revokeTokenSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get revokeToken => revokeTokenSubject.stream;
  void revokeDeviceToken(String token) async {
    try {
      revokeTokenSubject = PublishSubject<BaseResponse>();
      revokeTokenSubject.sink
          .add(await authRepositoryImpl.revokeDeviceToken(token));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      revokeTokenSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    tokenSubject.close();
    revokeTokenSubject.close();
  }
}
