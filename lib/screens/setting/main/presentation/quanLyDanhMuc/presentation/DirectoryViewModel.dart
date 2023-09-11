import 'package:rxdart/rxdart.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/model/diretory.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/repository/DirectoryRepositoryImpl.dart';

import '../data/remote/DirectoryAuthApiImpl.dart';

class DirectoryViewModel {
  var directorySubject = PublishSubject<Directory>();

  Stream<Directory> get directory => directorySubject.stream;
  DirectoryRepositoryImpl directoryRepositoryImpl =
      DirectoryRepositoryImpl(DirectoryAuthApiImpl());

  void getDirectory(String index) async {
    try {
      directorySubject = PublishSubject<Directory>();
      directorySubject.sink
          .add(await directoryRepositoryImpl.getAllTimeAppointment(index));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      directorySubject.sink.addError(e);
    }
  }
}
