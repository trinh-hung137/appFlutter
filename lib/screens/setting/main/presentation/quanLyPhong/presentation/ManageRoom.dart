import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/loading/CircularProgressIndicatorWidget.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/ListPhongKham.dart';
import 'DetailRoom.dart';
import 'RoomViewModel.dart';
import 'components/ContainerManageRoom.dart';
import 'components/ItemManageRoom.dart';

// ignore: must_be_immutable
class ManageRoom extends StatefulWidget {
  bool checkLoading;
  ManageRoom({
    Key? key,
    required this.checkLoading,
  }) : super(key: key);

  @override
  State<ManageRoom> createState() => _ManageRoomState();
}

class _ManageRoomState extends State<ManageRoom> {
  RoomViewModel roomViewModel = new RoomViewModel();
  Map<String, String> resultTimKiem = {};
  List<dynamic> trave = [];

  void receiveData(Map<String, String> ketqua) {
    setState(() {
      resultTimKiem = ketqua;
      loadData();
    });
  }

  //nhận data thêm mới
  void receiveDataAdd(ListPhongKham listPhongKham) {
      loadData();
      // trave.add(listPhongKham);
      setState(() {
        widget.checkLoading = false;
      });
  }

  @override
  void initState() {
    super.initState();
    widget.checkLoading = false;
    loadData();
  }

  Future<void> loadData() async {
    try{
      roomViewModel.getAllRoomManage();
      roomViewModel.room.listen((data) {
        setState(() {
          trave = data;
          widget.checkLoading=true;
        });
      });
    }catch(e){
      print('ManageRoom => Lỗi call api: ${e.toString()} ');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height_screen = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            text: AppLocalizations.of(context)!.translate("list_room_appbar"),
            check: false,
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, index) {
              if (index == 0) {
                return ContainerManageRoom(
                  dataSend: receiveData,
                  senDataAdd: receiveDataAdd,);
              } else {
                return Column(
                  children: [
                    Visibility(
                      child: Center(heightFactor: height_screen*0.01, child: CircularProgressIndicatorWidget()),
                      visible: !widget.checkLoading,
                    ),
                    Visibility(
                      visible: widget.checkLoading,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: trave.length,
                        itemBuilder:
                            (BuildContext context, int index) {
                          ListPhongKham listPhongKham = trave[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailRoom(
                                                listPhongKham:
                                                listPhongKham)))
                                    .then((value) {
                                  if (value[1] == 'xoa') {
                                    for (int i = 0;
                                    i < trave.length;
                                    i++) {
                                      ListPhongKham listPhong =
                                      trave[i];
                                      if (listPhong.id == value[0]) {
                                        setState(() {
                                          trave.removeAt(i);
                                        });
                                      }
                                    }
                                  } else if (value[1] == 'sua') {
                                    ListPhongKham listPhongTraVe =
                                    value[0];
                                    for (int i = 0;
                                    i < trave.length;
                                    i++) {
                                      ListPhongKham listPhong =
                                      trave[i];
                                      if (listPhong.id ==
                                          listPhongTraVe.id) {
                                        setState(() {
                                          listPhong = listPhongTraVe;
                                        });
                                      }
                                    }
                                  }
                                });
                              },
                              child: ItemManageRoom(
                                maPhong: listPhongKham.maPhong,
                                tenPhong: listPhongKham.tenPhong,
                                khoa: listPhongKham.khoa,
                                trangThai: listPhongKham.checkSuDung,
                              ));
                          // }
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
