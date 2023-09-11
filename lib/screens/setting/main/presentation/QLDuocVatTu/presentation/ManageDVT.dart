import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/view/EmptyDataView.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/presentation/AddDVT.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/presentation/DVTViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/DVT.dart';
import 'DetailDVT.dart';
import 'component/ItemDVT.dart';
import 'component/SearchDVT.dart';

class QuanLyVatTu extends StatefulWidget {
  const QuanLyVatTu({Key? key}) : super(key: key);

  @override
  State<QuanLyVatTu> createState() => _QuanLyVatTuState();
}

class _QuanLyVatTuState extends State<QuanLyVatTu> {
  List<DuocVatTu> listItem = [];
  List<DuocVatTu> responseAPI = [];
  final DVTViewModel dvtViewModel = new DVTViewModel();
  bool isLoaded = false;

  final _textEdittingControllerTen = TextEditingController();
  final _textEdittingControllerMa = TextEditingController();
  final _textEdittingControllerHoatChat = TextEditingController();
  final _textEdittingControllerTrangThai = TextEditingController();

  final FocusNode _focusNodeTen = FocusNode();
  final FocusNode _focusNodeMa = FocusNode();
  final FocusNode _focusNodeHoatChat = FocusNode();
  final FocusNode _focusNodeTrangthai = FocusNode();

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  void searchVatTu(List<String> value) {
    print(value.toString());
    listItem = responseAPI;
    List<DuocVatTu> listSearch = [];
    for (int i = 0; i < listItem.length; i++) {
      if (listItem[i].ma!.toLowerCase().contains(value[0]) &&
          listItem[i].ten!.toLowerCase().contains(value[1]) &&
          listItem[i].hoatchat!.toLowerCase().contains(value[2]) &&
          (listItem[i].sudung == true &&
                  "Hiệu lực".toLowerCase().contains(value[3].toLowerCase()) ||
              (listItem[i].sudung == false &&
                  "Hết hiệu lực"
                      .toLowerCase()
                      .contains(value[3].toLowerCase())))) {
        listSearch.add(listItem[i]);
      }
    }
    setState(() {
      listItem = listSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          check: false,
          text: AppLocalizations.of(context)!.translate("medical_manage"),
          onPress: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: listItem.length > 0
          ? ListView.builder(
              itemCount: listItem.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Column(
                    children: [
                      SearchDVT(
                        onPressAdd: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddDVT()))
                              .then((value) {
                            setState(() {
                              listItem.clear();
                              isLoaded = false;
                            });
                            callAPI();
                          });
                        },
                        onPressSearch: () {
                          print(_textEdittingControllerMa.text);
                          print(_textEdittingControllerTen.text);
                          print(_textEdittingControllerHoatChat.text);
                          print(_textEdittingControllerTrangThai.text);
                        },
                        textEdittingControllerTen: _textEdittingControllerTen,
                        textEdittingControllerMa: _textEdittingControllerMa,
                        textEdittingControllerHoatChat:
                            _textEdittingControllerHoatChat,
                        textEdittingControllerTrangThai:
                            _textEdittingControllerTrangThai,
                        focusNodeTen: _focusNodeTen,
                        focusNodeMa: _focusNodeMa,
                        focusNodeHoatChat: _focusNodeHoatChat,
                        focusNodeTrangthai: _focusNodeTrangthai,
                      ),
                      ItemQLDVT(
                        dvt: listItem[index],
                        onPressItem: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChiTietDuocVatTu(
                                        dvt: listItem[index],
                                      ))).then((value) {
                            if (value == 'refresh') {
                              setState(() {
                                listItem.remove(listItem[index]);
                              });
                            } else {
                              updateDVT(value);
                            }
                          });
                        },
                      )
                    ],
                  );
                } else {
                  return ItemQLDVT(
                    dvt: listItem[index],
                    onPressItem: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChiTietDuocVatTu(
                                    dvt: listItem[index],
                                  ))).then((value) {
                        if (value == 'refresh') {
                          setState(() {
                            listItem.remove(listItem[index]);
                          });
                        } else {
                          updateDVT(value);
                        }
                      });
                    },
                  );
                }
              })
          : Column(
              children: [
                SearchDVT(
                  onPressAdd: () {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddDVT()))
                        .then((value) {
                      setState(() {
                        listItem.clear();
                        isLoaded = false;
                      });
                      callAPI();
                    });
                  },
                  onPressSearch: () {
                    print(_textEdittingControllerMa.text);
                    print(_textEdittingControllerTen.text);
                    print(_textEdittingControllerHoatChat.text);
                    print(_textEdittingControllerTrangThai.text);
                  },
                  textEdittingControllerTen: _textEdittingControllerTen,
                  textEdittingControllerMa: _textEdittingControllerMa,
                  textEdittingControllerHoatChat:
                      _textEdittingControllerHoatChat,
                  textEdittingControllerTrangThai:
                      _textEdittingControllerTrangThai,
                  focusNodeTen: _focusNodeTen,
                  focusNodeMa: _focusNodeMa,
                  focusNodeHoatChat: _focusNodeHoatChat,
                  focusNodeTrangthai: _focusNodeTrangthai,
                ),
                isLoaded ? EmptyDataView() : CircularProgressIndicator(),
              ],
            ),
    );
  }

  void callAPI() async {
    try {
      dvtViewModel.getAllTimeAppointment();
      dvtViewModel.dvt.listen((data) {
        setState(() {
          isLoaded = true;
          listItem = data;
          responseAPI = data;
        });
      });
    } catch (e) {
      print('=================================\nloi lay danh sach vat tu: ' +
          e.toString());
    }
  }

  void updateDVT(DuocVatTu value) {
    for (int i = 0; i < listItem.length; i++) {
      if (listItem[i].id == value.id) {
        setState(() {
          listItem[i] = value;
        });
      }
    }
  }
}
