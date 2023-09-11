
import 'package:http/http.dart' show PublishSubject;
import 'package:rxdart/rxdart.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/data/model/ListPhongKham.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/data/remote/RoomApiImpl.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/data/repository/RoomRespositoryImpl.dart';
import '../../../../../main/data/model/BaseResponse.dart';

class RoomViewModel{
  var roomSubject = PublishSubject<List<ListPhongKham>>();
  Stream<List<ListPhongKham>> get room => roomSubject.stream;
  RoomRespositoryImpl respositoryImpl = RoomRespositoryImpl(RoomApiImpl());

  void getAllRoomManage() async {
    try {
      roomSubject = PublishSubject<List<ListPhongKham>>();
      roomSubject.sink.add(await respositoryImpl.getAllRoom());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      roomSubject.sink.addError(e);
    }
  }

    var addRoomSubject = PublishSubject<BaseResponse>();
    Stream<BaseResponse> get addroom => addRoomSubject.stream;

    void addRoomm(ListPhongKham listPhongKham) async {
      try {
        addRoomSubject = PublishSubject<BaseResponse>();
        addRoomSubject.sink.add(
            (await respositoryImpl.addRoom(listPhongKham)));
      } catch (e) {
        await Future.delayed(Duration(milliseconds: 500));
        addRoomSubject.sink.addError(e);
      }
    }
  var updateRoomSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get updateroom => updateRoomSubject.stream;

  void updateRoomm(ListPhongKham listPhongKham) async {
    try {
      updateRoomSubject = PublishSubject<BaseResponse>();
      updateRoomSubject.sink.add((await respositoryImpl
          .updateRoom(listPhongKham)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      updateRoomSubject.sink.addError(e);
    }
  }
  var deleteRoomSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get deleteRoom => deleteRoomSubject.stream;

  void deleteRoomm(String id) async {
    try {
      deleteRoomSubject = PublishSubject<BaseResponse>();
      deleteRoomSubject.sink.add(
          (await respositoryImpl.deleteRoom(id)) );
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      deleteRoomSubject.sink.addError(e);
    }
  }

}