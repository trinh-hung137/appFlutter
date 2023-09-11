import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/dialog/ErrorDialog.dart';
import 'package:vncare_qlhk/components/dialog/InputDialog.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyPhong/presentation/RoomViewModel.dart';

import '../../../../../../components/dialog/SelectPopup.dart';
import '../../../../../../components/loading/CircularProgressIndicatorWidget.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyNhanVien/data/model/NhanVien.dart';
import '../../quanLyPhong/data/model/ListPhongKham.dart';
import '../data/model/DichVuKham.dart';
import 'components/ContainerSelectRoom.dart';
import 'components/ItemSelectRoom.dart';


// ignore: must_be_immutable
class SelectRoom extends StatefulWidget {
  final DichVuKham dichVuKham;
  final NhanVien nhanVien;
  final bool checkBool;
  SelectRoom({
    Key? key,
    required this.nhanVien,
    required this.checkBool,
    required this.dichVuKham,
  }) : super(key: key);

  @override
  State<SelectRoom> createState() => _SelectRoomState();
}

List<ListPhongKham> listPhongKham = [];

class _SelectRoomState extends State<SelectRoom> {
  RoomViewModel roomViewModel = new RoomViewModel();
  bool checkLoading = true;
  List<dynamic> trave = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      roomViewModel.getAllRoomManage();
      roomViewModel.room.listen((data) {
        setState(() {
          //quan ly dich vu kham
          if (widget.checkBool == true) {
            trave = data;
            for (int i = 0; i < trave.length; i++) {
              ListPhongKham listPhongKham = trave[i];
              for (int i = 0; i < widget.dichVuKham.listPhong.length; i++) {
                if (listPhongKham.id == widget.dichVuKham.listPhong[i].id) {
                  listPhongKham.tuVanOnline =
                      widget.dichVuKham.listPhong[i].tuVanOnline;
                  listPhongKham.datLichCsyt =
                      widget.dichVuKham.listPhong[i].datLichCsyt;
                }
              }
            }
          } else {
            //quan ly nhan vien
            trave = data;
            for (int i = 0; i < trave.length; i++) {
              ListPhongKham listPhongKham = trave[i];
              for (int i = 0; i < widget.nhanVien.listPhong.length; i++) {
                if (listPhongKham.id == widget.nhanVien.listPhong[i].id) {
                  listPhongKham.tuVanOnline =
                      widget.nhanVien.listPhong[i].tuVanOnline;
                  listPhongKham.datLichCsyt =
                      widget.nhanVien.listPhong[i].datLichCsyt;
                }
              }
            }
          }
          checkLoading = false;
        });
      });
    } catch (e) {
      print('ManageRoom => Lỗi call api: ${e.toString()} ');
    }
  }

  // kiểm tra trang thai checkall tư vấn + đặt lịch
  bool checkAllTuVan() {
    for (int i = 0; i < trave.length; i++) {
      ListPhongKham listPhongKham = trave[i];
      if (listPhongKham.tuVanOnline == false) {
        return false;
      }
    }
    return true;
  }

  bool checkAllDatLich() {
    for (int i = 0; i < trave.length; i++) {
      ListPhongKham listPhongKham = trave[i];
      if (listPhongKham.datLichCsyt == false) {
        return false;
      }
    }
    return true;
  }

  // update all gia tri tu van + dat lich
  void updateTuVan() {
    setState(() {
      for (int i = 0; i < trave.length; i++) {
        ListPhongKham listPhongKham = trave[i];
        listPhongKham.tuVanOnline = true;
      }
      checkAllTuVan();
    });
  }

  void updateDatLich() {
    setState(() {
      for (int i = 0; i < trave.length; i++) {
        ListPhongKham listPhongKham = trave[i];
        listPhongKham.datLichCsyt = true;
      }
      checkAllDatLich();
    });
  }

  // remove all gia tri tu van + dat lich
  void removeTuVan() {
    setState(() {
      for (int i = 0; i < trave.length; i++) {
        ListPhongKham listPhongKham = trave[i];
        listPhongKham.tuVanOnline = false;
      }
      checkAllTuVan();
    });
  }

  void removeDatLich() {
    setState(() {
      for (int i = 0; i < trave.length; i++) {
        ListPhongKham listPhongKham = trave[i];
        listPhongKham.datLichCsyt = false;
      }
      checkAllDatLich();
    });
  }

//update tung item
  void updateItemTuVan(ListPhongKham listPhongKham, bool value) {
    setState(() {
      listPhongKham.tuVanOnline = !value;
    });
  }

  void updateItemDatLich(ListPhongKham listPhongKham, bool value) {
    setState(() {
      listPhongKham.datLichCsyt = !value;
    });
  }

  //lay kqua tu container ve
  Map<String, String> resultTimKiem = {};
  void receiveData(Map<String, String> ketqua) {
    setState(() {
      resultTimKiem = ketqua;
      print('SelectRoom -> Giá trị text đã nhập: ${resultTimKiem} ');
    });
  }

  @override
  Widget build(BuildContext context) {
    final height_screen = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.translate("list_room_appbar")),
          // centerTitle: true,
          actions: <Widget>[
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () async {
                    String? ketqua = await showDialog(
                        context: context,
                        builder: (context) {
                          return
                            SelectPopup(
                              result: [checkAllTuVan(), checkAllDatLich()]);
                        });
                    print(ketqua);
                    if (ketqua == 'allTuVan') {
                      updateTuVan();
                    } else if (ketqua == 'allDatLich') {
                      updateDatLich();
                    } else if (ketqua == 'removeTuVan') {
                      removeTuVan();
                    } else if (ketqua == 'removeDatLich') {
                      removeDatLich();
                    }
                  },
                  icon: Icon(
                    Icons.more_vert,
                    // size: 14,
                  ),
                );
              },
            )
          ],
          backgroundColor: Color(0xFF6F9BD4),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                  context,
                  widget.checkBool == true
                      ? [widget.dichVuKham, 'back']
                      : [widget.nhanVien, 'back']);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 14,
            ),
          ),
        ),
        body: Scaffold(
          body: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, index) {
                if (index == 0) {
                  return ContainerSelectRoom(
                    dataSend: receiveData,
                  );
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 8,left: 16,right: 16),
                    // color: Color.fromARGB(255, 178, 200, 219),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Visibility(
                          child: Center(heightFactor: height_screen*0.01, child: CircularProgressIndicatorWidget()),
                          visible: checkLoading,
                        ),
                        Visibility(
                          visible: !checkLoading,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: trave.length,
                            itemBuilder: (BuildContext context, int index) {
                              ListPhongKham listPhongKham = trave[index];
                              return ItemSelectRoom(
                                tenPhong: listPhongKham.tenPhong,
                                maPhong: listPhongKham.maPhong,
                                ktraTuVan: listPhongKham.tuVanOnline,
                                ktraDatLich: listPhongKham.datLichCsyt,
                                onClickTuVan: () {
                                  updateItemTuVan(listPhongKham,
                                      listPhongKham.tuVanOnline);
                                },
                                onClickDatLich: () {
                                  updateItemDatLich(listPhongKham,
                                      listPhongKham.datLichCsyt);
                                },
                              );
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 16,),
                Expanded(
                  child:
                  FixedBottomButton(text: AppLocalizations.of(context)!.translate("fixed_bottom_update"), icon: Qlhk.save_outlined, height: 32,press: (){
                    if (widget.checkBool == true) {
                      List<ListPhongKham> list = [];
                      for (int i = 0; i < trave.length; i++) {
                        ListPhongKham listPhongKham = trave[i];
                        // if (listPhongKham.tuVanOnline == true || listPhongKham.checkDangKiHen == true ||
                        //     listPhongKham.tuVanOnline == false && listPhongKham.checkDangKiHen == true ||
                        //     listPhongKham.checkDangKiHen == true && listPhongKham.tuVanOnline == false ||
                        //     listPhongKham.checkDangKiHen == false && listPhongKham.tuVanOnline == true ||
                        //     listPhongKham.checkDangKiHen == true && listPhongKham.tuVanOnline == true)
                        if(listPhongKham.datLichCsyt == true || listPhongKham.tuVanOnline == true)
                        {
                          list.add(listPhongKham);
                          // widget.dichVuKham.listPhong.add(listPhongKham);
                        }
                      }
                      widget.dichVuKham.listPhong = list;
                      print(
                          'SelectRoom -> Dịch vụ khám đã chọn phòng: ${widget.dichVuKham}');
                      Navigator.pop(context,
                          [widget.dichVuKham, 'update_dichVuKham']);
                    } else {
                      //quan ly nhan vien
                      List<ListPhongKham> list = [];
                      for (int i = 0; i < trave.length; i++) {
                        ListPhongKham listPhongKham = trave[i];
                        // if (listPhongKham.tuVanOnline == true && listPhongKham.checkDangKiHen == true ||
                        //     listPhongKham.tuVanOnline == false && listPhongKham.checkDangKiHen == true ||
                        //     listPhongKham.checkDangKiHen == false && listPhongKham.tuVanOnline == true)
                        if(listPhongKham.datLichCsyt == true || listPhongKham.tuVanOnline == true)
                        {
                          list.add(listPhongKham);
                          // widget.nhanVien.listPhong.add(listPhongKham);
                        }
                      }
                      widget.nhanVien.listPhong = list;
                      print(
                          'SelectRoom -> Nhân viên đã chọn phòng: ${widget.nhanVien}');
                      Navigator.pop(
                          context, [widget.nhanVien, 'update_nhanVien']);
                    }
                  },),
                ),
                SizedBox(width: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
