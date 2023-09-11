
import 'package:rxdart/rxdart.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/model/ChiTietLichHen.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/model/DanhSachLichHen.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/remote/ManageCaculatorApiImpl.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/repository/ManageCaculatorRespositoryImpl.dart';

class ManageCaculatorViewModel{
  var manageSubject = PublishSubject<ChiTietLichHen>();
  Stream<ChiTietLichHen> get manage => manageSubject.stream;
  ManageCaculatorRespositoryImpl respositoryImpl = ManageCaculatorRespositoryImpl(ManageCaculatorApiImpl());

  void getDetaill(String id) async{
    try{
      manageSubject = PublishSubject<ChiTietLichHen>();
      manageSubject.sink.add(await respositoryImpl.getDetail(id));
    }catch(e){
      await Future.delayed(Duration(milliseconds: 500));
      manageSubject.sink.addError(e);
    }
  }

  var searchSubject = PublishSubject<List<DanhSach>>();
  Stream<List<DanhSach>> get searchmanage => searchSubject.stream;

  void searchManagee(String param) async{
    try{
      searchSubject = PublishSubject<List<DanhSach>>();
      searchSubject.sink.add(await respositoryImpl.searchService(param));
    }catch(e){
      await Future.delayed(Duration(milliseconds: 500));
      searchSubject.sink.addError(e);
    }
  }
}