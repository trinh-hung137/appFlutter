import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/model/ChiTietLichHen.dart';

import '../model/DanhSachLichHen.dart';

abstract class ManageCaculatorApi{
  Future<List<DanhSach>> searchService(String param);
  Future<ChiTietLichHen> getDetail(String id);
}