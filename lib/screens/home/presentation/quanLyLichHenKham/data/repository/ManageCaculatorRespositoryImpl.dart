
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/model/ChiTietLichHen.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/model/DanhSachLichHen.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/remote/ManageCaculatorApi.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/repository/ManageCaculatorRespository.dart';

class ManageCaculatorRespositoryImpl implements ManageCaculatorRespository{
  late ManageCaculatorApi manageCaculatorApi;

  ManageCaculatorRespositoryImpl(ManageCaculatorApi ManageCaculatorApi ){
    this.manageCaculatorApi = ManageCaculatorApi;
  }

  @override
  Future<ChiTietLichHen> getDetail(String id) {
    // TODO: implement getDetail
    return manageCaculatorApi.getDetail(id);
  }

  @override
  Future<List<DanhSach>> searchService(String param) {
    // TODO: implement searchService
    return manageCaculatorApi.searchService(param);
  }
}