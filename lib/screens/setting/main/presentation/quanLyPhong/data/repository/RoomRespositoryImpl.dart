import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/data/model/ListPhongKham.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/data/remote/RoomApi.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/data/repository/RoomRespository.dart';

class RoomRespositoryImpl implements RoomRespository{
  late RoomApi roomApi;

  RoomRespositoryImpl(RoomApi roomApi){
    this.roomApi = roomApi;
  }
  @override
  Future<BaseResponse> addRoom(ListPhongKham phongKham) {
    // TODO: implement addRoom
    return roomApi.addRoom(phongKham);
  }

  @override
  Future<BaseResponse> deleteRoom(String id) {
    // TODO: implement deleteRoom
    return roomApi.deleteRoom(id);
  }

  @override
  Future<List<ListPhongKham>> getAllRoom() {
    // TODO: implement getAllRoom
    return roomApi.getAllRoom();
  }

  @override
  Future<BaseResponse> updateRoom(ListPhongKham listPhongKham) {
    // TODO: implement updateRoom
    return roomApi.updateRoom(listPhongKham);
  }

}