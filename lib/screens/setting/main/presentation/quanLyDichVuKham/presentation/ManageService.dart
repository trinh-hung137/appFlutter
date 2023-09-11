import 'package:flutter/material.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDichVuKham/presentation/ServiceViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/loading/CircularProgressIndicatorWidget.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/DichVuKham.dart';
import 'DetailService.dart';
import 'components/ContainerServiceCheckup.dart';
import 'components/ItemServiceCheckup.dart';

// ignore: must_be_immutable
class ManageService extends StatefulWidget {
  bool checkLoading;
  ManageService({
    Key? key,
    required this.checkLoading,
  }) : super(key: key);

  @override
  State<ManageService> createState() => _ManageServiceState();
}

class _ManageServiceState extends State<ManageService> {
  ServiceViewModel serviceViewModel = new ServiceViewModel();
  Map<String, String> resultTimKiem = {};
  List<dynamic> trave = [];
  // nhận data tìm kiếm từ container
  void receiveData(Map<String, String> ketqua) {
    setState(() {
      resultTimKiem = ketqua;
      print('ManageService -> Giá trị text đã nhập: $resultTimKiem');
    });
  }

  //nhận data thêm mới
  void receiveDataAdd(DichVuKham dichVuKham) {
    setState(() {
      print('MangageService -> Dịch vụ khám được nhận thêm: ${dichVuKham}');
      // trave.add(dichVuKham);
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
      serviceViewModel.getAllServiceManage();
      serviceViewModel.service.listen((data) {
        setState(() {
          trave = data;
          widget.checkLoading = true;
        });
      });
    }catch(e){
      print('ManageService => Lỗi call api: ${e.toString()} ');
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
            text: AppLocalizations.of(context)!.translate("list_service_appbar"),
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
                return ContainerServiceCheckup(
                    onData: receiveData,
                    senData: receiveDataAdd,
                  );
              } else {
                return Container(
                  margin: EdgeInsets.only(top: 8),
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
                          itemBuilder: (BuildContext context, int index) {
                            DichVuKham dichVuKham = trave[index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailServiceCheckup(
                                                  dichvukham:
                                                  dichVuKham)))
                                      .then((value) {
                                    print(
                                        'ManageService -> Mảng giá trị nhận được từ DetailService: $value');
                                    if (value[1] == 'xoa') {
                                      for (int i = 0;
                                      i < trave.length;
                                      i++) {
                                        DichVuKham dichvu = trave[i];
                                        if (dichvu.id == value[0]) {
                                          setState(() {
                                            trave.removeAt(i);
                                            print(
                                                'ManageService xóa dịch vụ khám id = ${value[0]} thành công');
                                          });
                                        }
                                      }
                                    } else if (value[1] == 'sua') {
                                      DichVuKham dichVuTraVe = value[0];
                                      for (int i = 0;
                                      i < trave.length;
                                      i++) {
                                        DichVuKham dichVu = trave[i];
                                        if (dichVu.id == dichVuTraVe.id) {
                                          setState(() {
                                            dichVu = dichVuTraVe;
                                          });
                                        }
                                      }
                                    }
                                  });
                                },
                                child: ItemServiceCheckup(
                                  trangThai: dichVuKham.trangThai,
                                  tenDichVu: dichVuKham.tenDichVu,
                                  maDichVu: dichVuKham.maDichVu,
                                  giaTuVan: dichVuKham.phiTuVanCu,
                                  giaDatLich: dichVuKham.phiDatLichCu,
                                ));
                            // }
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
