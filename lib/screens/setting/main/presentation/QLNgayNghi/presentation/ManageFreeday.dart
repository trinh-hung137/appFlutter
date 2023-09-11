import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/view/EmptyDataView.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/presentation/AddFreeday.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/presentation/FreeDayViewModel.dart';
import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/FreeDay.dart';
import 'DetailFreeday.dart';
import 'component/ItemFreeday.dart';
import 'component/SearchFreeDay.dart';

class FreeDayManager extends StatefulWidget {
  const FreeDayManager({Key? key}) : super(key: key);

  @override
  State<FreeDayManager> createState() => _FreeDayManagerState();
}

class _FreeDayManagerState extends State<FreeDayManager> {
  List<FreeDay> listItem = [];
  List<FreeDay> responseAPI = [];
  bool isLoaded = false;
  final FreeDayViewModel freeDayViewModel = new FreeDayViewModel();

  final TextEditingController _textEditingControllerLoai =
      TextEditingController();
  final TextEditingController _textEditingControllerNgay =
      TextEditingController();

  final FocusNode _focusNodeLoai = FocusNode();
  final FocusNode _focusNodeNgay = FocusNode();

  @override
  void initState() {
    super.initState();
    callAPI();
  }

  void searchFreeDay(List<String> value) {
    print(value[0]);
    print(value[1]);
    print('vao search');
    List<FreeDay> listSearch = [];
    for (int i = 0; i < listItem.length; i++) {
      String loai = listItem[i].type == '1'
          ? "Ngay cu the trong nam"
          : "Ngay co dinh hang tuan";
      if (loai.toLowerCase().contains(value[0]) &&
          ((listItem[i].thu!.toLowerCase().contains(value[1])) ||
              (listItem[i].fromDay!.contains(value[1])) ||
              (listItem[i].toDay!.contains(value[1])))) {
        listSearch.add(listItem[i]);
      }
    }
    setState(() {
      listItem = listSearch;
    });
  }

  void initDataAgain() {
    setState(() {
      listItem = responseAPI;
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
          text: AppLocalizations.of(context)!.translate("freeday_manage"),
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
                      ListSearchFreeDay(
                        textEditingControllerLoai: _textEditingControllerLoai,
                        textEditingControllerNgay: _textEditingControllerNgay,
                        focusNodeLoai: _focusNodeLoai,
                        focusNodeNgay: _focusNodeNgay,
                        onPressSearch: () {
                          print(_textEditingControllerLoai.text);
                          print(_textEditingControllerNgay.text);
                        },
                        onPressAdd: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddFreeDay()))
                              .then((value) {
                            setState(() {
                              listItem.clear();
                              isLoaded = false;
                            });
                            callAPI();
                          });
                        },
                      ),
                      ItemFreeday(
                        freeDay: listItem[index],
                        onPressItem: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FreeDayDetail(
                                    freeDay: listItem[index],
                                  ))).then((value) {
                            if (value == 'refresh')
                              setState(() {
                                listItem.remove(listItem[index]);
                              });
                            else
                              updateFreeday(value);
                          });
                        },
                      ),
                    ],
                  );
                }
                return ItemFreeday(
                  freeDay: listItem[index],
                  onPressItem: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FreeDayDetail(
                              freeDay: listItem[index],
                            ))).then((value) {
                      if (value == 'refresh')
                        setState(() {
                          listItem.remove(listItem[index]);
                        });
                      else
                        updateFreeday(value);
                    });
                  },

                );
              })
          : Column(
              children: [
                ListSearchFreeDay(
                  textEditingControllerLoai: _textEditingControllerLoai,
                  textEditingControllerNgay: _textEditingControllerNgay,
                  focusNodeLoai: _focusNodeLoai,
                  focusNodeNgay: _focusNodeNgay,
                  onPressSearch: () {
                    print(_textEditingControllerLoai.text);
                    print(_textEditingControllerNgay.text);
                  },
                  onPressAdd: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddFreeDay())).then((value) {
                      setState(() {
                        listItem.clear();
                        isLoaded = false;
                      });
                      callAPI();
                    });
                  },
                ),
                isLoaded ? EmptyDataView() : CircularProgressIndicator(),
              ],
            ),
    );
  }

  void callAPI() async {
    try {
      freeDayViewModel.getAllTimeAppointment();
      freeDayViewModel.freeday.listen((data) {
        setState(() {
          isLoaded = true;
          listItem = data;
          responseAPI = data;
        });
      });
    } catch (e) {
      print('===============\nco loi call api freeday' + e.toString());
    }
  }

  void updateFreeday(FreeDay value) {
    for (int i = 0; i < listItem.length; i++) {
      if (listItem[i].id == value.id) {
        setState(() {
          listItem[i] = value;
        });
      }
    }
  }
}
