import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDichVuKham/data/model/DichVuKham.dart';

import '../../../../../../main/data/model/BaseResponse.dart';
import '../remote/ServiceApi.dart';
import 'ServiceRespository.dart';

class ServiceRespositoryImpl implements ServiceRespository{
  late ServiceApi serviceApi;
  ServiceRespositoryImpl(ServiceApi ServiceApi){
    this.serviceApi = ServiceApi;
  }
  @override
  Future<BaseResponse> addService(DichVuKham dichVuKham) {
    // TODO: implement addService
    return serviceApi.addService(dichVuKham);
  }

  @override
  Future<BaseResponse> deleteService(String id) {
    // TODO: implement deleteService
    return serviceApi.deleteService(id);
  }

  @override
  Future<List<DichVuKham>> getAllService() {
    // TODO: implement getAllService
    return serviceApi.getAllService();
  }

  @override
  Future<BaseResponse> updateService(DichVuKham dichVuKham) {
    // TODO: implement updateService
    return serviceApi.updateService(dichVuKham);
  }

}