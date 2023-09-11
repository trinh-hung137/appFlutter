import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/model/diretory.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/remote/DirectoryAuthApi.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/remote/DirectoryAuthApiImpl.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/repository/DirectoryRepository.dart';

class DirectoryRepositoryImpl implements DirectoryRepository{
  late DirectoryAuthApi directoryAuthApi;

  DirectoryRepositoryImpl(DirectoryAuthApi timeAuthApi){
    this.directoryAuthApi=timeAuthApi;
  }

  @override
  Future <Directory> getAllTimeAppointment(String index) {
    return directoryAuthApi.getDirectory(index);
  }


}