import 'package:flutter/material.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/presentation/DirectoryViewModel.dart';
import 'dart:async';
import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/loading/CircularProgressIndicatorWidget.dart';
import '../../../../../../config/styles/Dimens.dart';
import '../../QLDuocVatTu/presentation/ManageDVT.dart';
import '../../QLNgayNghi/presentation/ManageFreeday.dart';
import '../../QLThoiGianKham/presentation/ManageTime.dart';
import '../../manager-khoa/presentation/SearchKhoa/ListKhoa.dart';
import '../../quanLyDichVuKham/presentation/ManageService.dart';
import '../../quanLyNhanVien/presention/ManageStaff.dart';
import '../../quanLyPhong/presentation/ManageRoom.dart';

class DetailSpinner extends StatefulWidget {
  final String value1;
  final String? titleAppbar;

  DetailSpinner({Key? key, required this.value1, this.titleAppbar})
      : super(key: key);

  @override
  State<DetailSpinner> createState() => _DetailSpinnerState();
}

class _DetailSpinnerState extends State<DetailSpinner> {
  final DirectoryViewModel directoryViewModel = new DirectoryViewModel();
  final List<String> listDanhMucSetting = [
    "Quản lý khoa",
    "Quản lý phòng",
    "Quản lý nhân viên",
    "Dịch vụ khám",
    "Tạo thời gian khám bệnh",
    "Dược vật tư",
    "Ngày nghỉ"
  ];

  //list trung gian
  List<String> list = [];
  bool checkLoad = true;

  //loadData
  Future<void> loadData() async {
    directoryViewModel.getDirectory(widget.value1);
    directoryViewModel.directory.listen((data) {
      if (data.toString().isNotEmpty) {
        setState(() {
          list = data.listItem!;
          checkLoad = false;
        });
      } else {
        print("Goi k thanh cong");
      }
    });
  }

  // late String result = 'Tất cả';

  bool checkDanhMuc = true;

  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  String textTimKiem = '';

  @override
  void initState() {
    super.initState();
    if(widget.value1 != 'danhmuc'){
      loadData();
    }else{
      setState(() {
        checkDanhMuc = false;
        list = listDanhMucSetting;
      });
    }
    focusNode.addListener(() {
      setState(() {
        textTimKiem = textController.text;
      });
    });
    // Timer.periodic(Duration(seconds: 350), (timer) {
    //   setState(() {
    //     textTimKiem = TextEditingController().text;
    //   });
    // });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width_screen = MediaQuery.of(context).size.width;
    print('Giá trị id bên listDrop nhận được là: ${widget.value1}');
    print('checkDanhMuc = $checkDanhMuc');
    print('gia tri tim kiem: $textTimKiem');
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          // backgroundColor: Colors.grey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
                text: "Danh mục ${widget.titleAppbar}",
                check: false,
                onPress: () {
                  Navigator.pop(context);
                }),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Visibility(
                  visible: checkDanhMuc,
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    height: 50,
                    child: TextField(
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xFF444444),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: textController,
                        focusNode: focusNode,
                        // onChanged: onChanged,
                        decoration: new InputDecoration(
                          hintText: 'Nhập giá trị cần tìm',
                          contentPadding: const EdgeInsets.only(
                              left: defaultTextInsideBoxPadding, right: 0),
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFE0E0E0), width: 1.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(4.0),
                          ),
                          suffixIcon: Visibility(
                            // visible: isShowIcon ?? false,
                            visible: focusNode.hasFocus == false &&
                                    textController.text != ''
                                ? true
                                : false,
                            child: GestureDetector(
                              onTap: () {
                                textController.clear();
                              },
                              child: Icon(
                                Qlhk.cancel,
                                size: 14,
                              ),
                            ),
                          ),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              print(
                                  'DetailSpinner -> Giá trị tìm kiếm = $textTimKiem');
                            },
                            child: Icon(
                              Qlhk.search,
                              size: 14,
                            ),
                          ),
                          prefixIconConstraints: BoxConstraints(
                            minWidth: 30,
                            minHeight: 25,
                          ),
                          suffixIconConstraints: BoxConstraints(
                            minWidth: 30,
                            minHeight: 25,
                          ),
                        )),
                  ),
                ),
                // SizedBox(
                //   height: 8,
                // ),
                Visibility(
                    visible: checkDanhMuc == false ? false: checkLoad,
                    child: Center(
                      heightFactor: width_screen*0.01,
                      child: CircularProgressIndicatorWidget(),
                    )),
                Visibility(
                  visible: checkDanhMuc == false ? true : !checkLoad,
                  child: Expanded(
                    child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              // setState(() {
                              //  });
                              if (widget.value1 == 'danhmuc') {
                                if (index == 0) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListKhoa()));
                                } else if (index == 1) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ManageRoom(
                                                checkLoading: false,
                                              )));
                                } else if (index == 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ManageStaff(
                                                checkLoading: false,
                                              )));
                                } else if (index == 3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ManageService(
                                                checkLoading: false,
                                              )));
                                } else if (index == 4) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimeManage()));
                                } else if (index == 5) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuanLyVatTu()));
                                } else if (index == 6) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FreeDayManager()));
                                }
                              } else {
                                Navigator.pop(context, list[index].toString());
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  height: 50,
                                  // color: Colors.white,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 1),
                                        ),
                                      ]),
                                  // margin: EdgeInsets.all(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      '${index + 1}. ${list[index]}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: list.length),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
