import 'package:flutter/material.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyNhanVien/presention/StaffViewModel.dart';
import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/loading/CircularProgressIndicatorWidget.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/NhanVien.dart';
import 'DetailStaff.dart';
import 'components/ContainerManageStaff.dart';
import 'components/ItemManageStaff.dart';

// ignore: must_be_immutable
class ManageStaff extends StatefulWidget {
  bool checkLoading;
  ManageStaff({Key? key, required this.checkLoading}) : super(key: key);

  @override
  State<ManageStaff> createState() => _ManageStaffState();
}

class _ManageStaffState extends State<ManageStaff> {
  StaffViewModel staffViewModel = new StaffViewModel();
  Map<String, String> resultTimKiem = {};
  List<dynamic> trave = [];

  void receiveData(Map<String, String> ketqua) {
    setState(() {
      resultTimKiem = ketqua;
      loadData();
    });
  }
//nhận data thêm mới
  void receiveDataAdd(NhanVien nhanVien) {
    setState(() {
      // trave.add(nhanVien);
      loadData();
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
      staffViewModel.getAllStaffManage();
      staffViewModel.staff.listen((data) {
        setState(() {
          trave = data;
          widget.checkLoading = true;
        });
      });
    }catch(e){
      print('ManageStaff => Lỗi call api: ${e.toString()} ');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width_screen = MediaQuery.of(context).size.width;
    final height_screen = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: AppLocalizations.of(context)!.translate("list_staff_appbar"),
              check: false,
              onPress: () {
                Navigator.pop(context,'back');
              },
            ),
          ),
          body: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, index) {
                if (index == 0) {
                  return ContainerManageStaff(
                      dataSend: receiveData,
                      senDataAdd: receiveDataAdd,
                    );
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 8),
                    width: width_screen,
                    child: Column(
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
                              NhanVien nhanVien = trave[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailStaff(
                                                  nhanVien:
                                                  nhanVien)))
                                      .then((value) {
                                    if (value[1] == 'xoa') {
                                      for (int i = 0;
                                      i < trave.length;
                                      i++) {
                                        NhanVien xoaNhanVien = trave[i];
                                        if (xoaNhanVien.id == value[0]) {
                                          setState(() {
                                            trave.removeAt(i);
                                          });
                                        }
                                      }
                                    } else if (value[1] == 'sua') {
                                      NhanVien suaNhanVienTraVe =
                                      value[0];
                                      for (int i = 0;
                                      i < trave.length;
                                      i++) {
                                        NhanVien suaNhanVien = trave[i];
                                        if (suaNhanVien.id ==
                                            suaNhanVienTraVe.id) {
                                          setState(() {
                                            suaNhanVien =
                                                suaNhanVienTraVe;
                                          });
                                        }
                                      }
                                    }
                                  });
                                },
                                child: ItemManageStaff(
                                    maNV: nhanVien.maNv,
                                    maBacSy: nhanVien.maBs,
                                    tenNV: nhanVien.tenNv,
                                    khoa: nhanVien.khoa,
                                    loaiNV: nhanVien.loaiNv,
                                    phong: nhanVien.phong),
                              );
                            },

                          ),
                        ),
                      ],
                    ),
                  );
                }
              }),
          ),
    );
  }
}
