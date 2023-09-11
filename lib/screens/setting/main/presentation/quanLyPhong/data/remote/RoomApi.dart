
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/data/model/ListPhongKham.dart';
import '../../../../../../main/data/model/BaseResponse.dart';
abstract class RoomApi{
  Future<List<ListPhongKham>> getAllRoom();
  Future<BaseResponse> addRoom(ListPhongKham phongKham);
  Future<BaseResponse> updateRoom(ListPhongKham listPhongKham);
  Future<BaseResponse> deleteRoom(String id);
}