import 'package:flutter/material.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/presentation/ManageCaculatorViewModel.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/presentation/components/ContainerManageCaculator.dart';

import '../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../utils/AppLocalizations.dart';
import '../data/model/DanhSachLichHen.dart';
import 'DetailManageCaculator.dart';
import 'components/ItemManageCaculator.dart';

// ignore: must_be_immutable
class ManageCaculator extends StatefulWidget {
  ManageCaculator({Key? key}): super(key:key);

  @override
  State<ManageCaculator> createState() => _ManageCaculatorState();
}

class _ManageCaculatorState extends State<ManageCaculator> {
  ManageCaculatorViewModel viewModel = new ManageCaculatorViewModel();
  ScrollController _scrollController = ScrollController();
  Map<String, String> resultTimKiem = {};
  //khoi tao số lượng hiển thị list ban đầu
  int trang = 1;
  int soDong = 3;
  bool loading = true;
  List<DanhSach> danhsachlichhen = [];
  List<DanhSach> danhsachHienThi = [];
//nhận data trả về từ container1
  void receivedData(Map<String, String> ketqua) {
    setState(() {
      resultTimKiem = ketqua;
      print('ManageCaculator -> Giá trị text đã nhập: ${resultTimKiem}');
      initApi();
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
          () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          load();
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  //call api

  void initApi() async {
    try{
      viewModel.searchManagee('tuNgay=${resultTimKiem['tuNgay']}&denNgay=${resultTimKiem['denNgay']}&trangThaiDongPhi&kenhDangKy&trangThaiLichHen&trangThaiDenKham&trang=1&soDong=10');
      viewModel.searchmanage.listen((data) {
        setState(() {
          danhsachlichhen = data;
          print('Chieu dai list api tra ve: ${danhsachlichhen.length}');
          if (soDong * trang <= danhsachlichhen.length) {
            for (int i = 0; i < soDong * trang; i++) {
              danhsachHienThi.add(danhsachlichhen[i]);
            }
          }
        });
      });
    }catch(e){
      print('ManageCaculator => Lỗi call api: ${e.toString()} ');
    }
    // String apiUrl =
    //     'https://staging-apidatlichkham.vncare.vn/patient_api/api/QlhkMobile/v1.3.0/business-service/';
    // String param =
    //     'danhSachLichHenKhamCsyt?tuNgay=${resultTimKiem['tuNgay']}&denNgay=${resultTimKiem['denNgay']}&trangThaiDongPhi&kenhDangKy&trangThaiLichHen&trangThaiDenKham&trang=1&soDong=10';
    // final ketqua = await BaseApi().get(apiUrl, param);
    // DanhSachLichHen kqua = danhSachLichHenFromJson(ketqua);
    // setState(() {
    //   Result ketqua = kqua.result;
    //   danhsachlichhen = ketqua.danhSach;
    //   print('Chieu dai list api tra ve: ${danhsachlichhen.length}');
    //   if (soDong * trang <= danhsachlichhen.length) {
    //     for (int i = 0; i < soDong * trang; i++) {
    //       danhsachHienThi.add(danhsachlichhen[i]);
    //     }
    //   }
    // });
  }

  void load() {
    trang += 1;
    if (loading == false) {
      setState(() {
        loading = true;
      });
    }
    if (soDong * trang <= danhsachlichhen.length) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          for (int i = soDong * (trang - 1); i < soDong * trang; i++) {
            danhsachHienThi.add(danhsachlichhen[i]);
          }
          loading = false;
        });
      });
    } else {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          for (int i = soDong * (trang - 1); i < danhsachlichhen.length; i++) {
            danhsachHienThi.add(danhsachlichhen[i]);
          }
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width_screen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
              text: AppLocalizations.of(context)!.translate('offline_title'),
              check: false,
              onPress: () {
                Navigator.pop(context);
              }),
        ),
        body: ListView.builder(
            controller: _scrollController,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return  ContainManageCaculator(
                  sentData: receivedData,
                );
              } else if (index == 1) {
                print('trang $trang');
                print('soDong $soDong');
                return Container(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: danhsachHienThi.length,
                          itemBuilder: (BuildContext context, int index) {
                            print('Item thu: $index');
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailManageCaculator(
                                              idHenKham: danhsachHienThi[index]
                                                  .henKhamId)),
                                );
                              },
                              child: ItemAppointment(
                                trangThaiLichHen:
                                danhsachHienThi[index].maTrangThaiLichHen,
                                title: danhsachHienThi[index].trangThaiLichHen,
                                valueSate:
                                danhsachHienThi[index].trangThaiDenKham,
                                valueActor: danhsachHienThi[index].tenBenhNhan,
                                valueLocation:
                                danhsachHienThi[index].tenPhongKham,
                                valueCause: danhsachHienThi[index].yeuCauKham,
                                valueDate: danhsachHienThi[index].ngayGioHen,
                                trangThaiDenKham:
                                danhsachHienThi[index].maTrangThaiDenKham,
                              ),
                            );
                            // }
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ));
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: loading,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                );
              }
            }));
  }
}
