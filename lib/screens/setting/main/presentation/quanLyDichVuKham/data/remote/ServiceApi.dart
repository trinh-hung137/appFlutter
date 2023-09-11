
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDichVuKham/data/model/DichVuKham.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class ServiceApi{
  Future<List<DichVuKham>> getAllService();
  Future<BaseResponse> addService(DichVuKham dichVuKham);
  Future<BaseResponse> updateService(DichVuKham dichVuKham);
  Future<BaseResponse> deleteService(String id);
}