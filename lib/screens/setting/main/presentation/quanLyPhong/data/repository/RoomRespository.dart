import '../../../../../../main/data/model/BaseResponse.dart';
import '../model/ListPhongKham.dart';

abstract class RoomRespository{
  Future<List<ListPhongKham>> getAllRoom();
  Future<BaseResponse> addRoom(ListPhongKham phongKham);
  Future<BaseResponse> updateRoom(ListPhongKham listPhongKham);
  Future<BaseResponse> deleteRoom(String id);
}