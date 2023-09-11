import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/appbar/CustomAppBar.dart';
import 'package:vncare_qlhk/components/view/EmptyDataView.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../../quanLyDanhMuc/presentation/DetailSpinner.dart';
import '../../data/model/Khoa.dart';
import '../DetailKhoa/DetailKhoa.dart';
import '../NewKhoa/NewKhoa.dart';
import '../ViewModelKhoa.dart';
import '../components/ItemKhoa.dart';
import 'SearchKhoa.dart';

class ListKhoa extends StatefulWidget {
  ListKhoa({Key? key}) : super(key: key);

  @override
  State<ListKhoa> createState() => _ListKhoaState();
}

class _ListKhoaState extends State<ListKhoa> {
  List<Department> listkhoa = [];
  List<Department> dskhoa = [];
  bool isCheck = false;
  final ViewModelKhoa viewModelKhoa = new ViewModelKhoa();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostApi();
  }

  dataAgain() {
    setState(() {
      listkhoa = dskhoa;
    });
  }

  void searchlistKhoa(value) {
    List<Department> listSearchKhoa = [];
    for (int i = 0; i < listkhoa.length; i++) {
      if ((listkhoa[i].idDep!.toLowerCase().contains(value[0])) &&
          (listkhoa[i].name!.toLowerCase().contains(value[1])) &&
          (listkhoa[i].managerDep!.toLowerCase().contains(value[2])) &&
          (listkhoa[i].state!.toLowerCase().contains(value[3]))) {
        listSearchKhoa.add(listkhoa[i]);
      }
    }
    setState(() {
      listkhoa = listSearchKhoa;
      print(listkhoa.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    double deviceHeight = deviceData.size.height;

    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                text: AppLocalizations.of(context)!.translate("appbar_list_department_title"),
                check: false,
                onPress: () {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailSpinner(titleAppbar: '', value1: '46')),
                  //     (route) => false);
                  Navigator.of(context).pop();
                },
              ),
            ),
            backgroundColor: Colors.white,
            body: listkhoa.length > 0
                ? ListView.separated(
                    itemCount: listkhoa.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 0),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                              child: SearchKhoa(
                                clickSearch: (value) {
                                  //getPostApi();
                                  searchlistKhoa(value);
                                },
                                clickAdd: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => const NewKhoa()),);
                                  Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => NewKhoa()))
                                      .then((value) {
                                    setState(() {
                                      getPostApi();
                                    });
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                //     DetailKhoa(
                                //       dataList: listkhoa[index],
                                //     )));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailKhoa(dataList: listkhoa[index]))).then((value) {
                                  setState(() {
                                    getPostApi();
                                  });
                                });
                              },
                              child: ItemKhoa(
                                  maKhoa: listkhoa[index].idDep,
                                  tenKhoa: listkhoa[index].name,
                                  truongKhoa: listkhoa[index].managerDep,
                                  trangThai: listkhoa[index].state),
                            )
                          ],
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailKhoa(
                          //   dataList : listkhoa[index],
                          // )));
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailKhoa(dataList: listkhoa[index])))
                              .then((value) {
                            setState(() {
                              getPostApi();
                            });
                          });
                        },
                        child: ItemKhoa(
                            maKhoa: listkhoa[index].idDep,
                            tenKhoa: listkhoa[index].name,
                            truongKhoa: listkhoa[index].managerDep,
                            trangThai: listkhoa[index].state),
                      );
                    })
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                        child: SearchKhoa(
                          clickSearch: (value) {
                            //getPostApi();
                            searchlistKhoa(value);
                          },
                          clickAdd: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const NewKhoa()),);
                            Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => NewKhoa()))
                                .then((value) {
                              setState(() {
                                getPostApi();
                              });
                            });
                          },
                        ),
                      ),
                      Center(
                        //heightFactor: deviceHeight * 0.01 ,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              isCheck ? EmptyDataView() : CircularProgressIndicator()
                            ],
                      ))
                    ],
                  )));
  }

  void getPostApi() async {
    try {
      viewModelKhoa.getAllKhoa();
      viewModelKhoa.khoa.listen((khoa) {
        setState(() {
          isCheck = true;
          listkhoa = khoa;
          dskhoa = khoa;
        });
        if (khoa.length == 0) {
          print('Không có data');
        }
      });
    } catch (e) {
      print('Lỗi khi lấy data');
      print(e);
    }
  }
}
