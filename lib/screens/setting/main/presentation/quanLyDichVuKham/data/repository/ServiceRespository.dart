import '../../../../../../main/data/model/BaseResponse.dart';
import '../model/DichVuKham.dart';

abstract class ServiceRespository{
  Future<List<DichVuKham>> getAllService();
  Future<BaseResponse> addService(DichVuKham dichVuKham);
  Future<BaseResponse> updateService(DichVuKham dichVuKham);
  Future<BaseResponse> deleteService(String id);
}