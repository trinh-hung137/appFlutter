import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/inputfieldform/InputSearchHour.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/presentation/TimeViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/Times.dart';
import 'component/ItemHour.dart';
import 'component/LineStartHourList.dart';

class ListHour extends StatefulWidget {
  const ListHour({Key? key, required this.time}) : super(key: key);
  final Times time;

  @override
  State<ListHour> createState() => _ListHourState();
}

class _ListHourState extends State<ListHour> {
  List<Hourlist> listItem = [];
  List<Hourlist> dataBackup = [];
  TextEditingController textEditingController = TextEditingController();
  late bool isCheckAll;
  final TimeViewModel timeViewModel = new TimeViewModel();

  @override
  void initState() {
    super.initState();
    initData();
    initCheckAll();
  }

  initCheckAll() {
    bool CheckAll = false;
    for (int i = 0; i < listItem.length; i++) {
      if (listItem[i].check == false) {
        CheckAll = false;
      }
    }
    setState(() {
      isCheckAll = CheckAll;
    });
  }

  initData() async {
    final result = widget.time.hourlist!;
    for (int i = 0; i < result.length; i++) {
      listItem.add(Hourlist(
          id: result[i].id,
          stt: result[i].stt,
          check: result[i].check,
          time: result[i].time));
    }
    dataBackup = listItem;
  }

  initDataAgain() {
    setState(() {
      listItem = dataBackup;
    });
  }

  resetData(bool value) {
    for (int i = 0; i < listItem.length; i++) {
      setState(() {
        listItem[i].check = value;
      });
    }
  }

  void _changeState(value) {
    setState(() {
      isCheckAll = value;
      resetData(isCheckAll);
    });
  }

  void _changeStateLine(value, index) {
    print(value.runtimeType);
    setState(() {
      listItem[index].check = value;
      bool CheckAll = true;
      for (int i = 0; i < listItem.length; i++) {
        if (listItem[i].check == false) {
          CheckAll = false;
        }
      }
      setState(() {
        isCheckAll = CheckAll;
      });
    });
  }

  searchItem() {
    String input = textEditingController.text;
    print(input);
    List<Hourlist> listSearch = [];
    for (int i = 0; i < listItem.length; i++) {
      if (listItem[i]
              .stt
              .toString()
              .toLowerCase()
              .contains(input.toLowerCase()) ||
          listItem[i].time!.contains(input)) {
        listSearch.add(listItem[i]);
      }
    }
    setState(() {
      listItem = listSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            check: false,
            text: AppLocalizations.of(context)!
                .translate("time_hour_appointment"),
            onPress: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Scaffold(
          bottomNavigationBar: Container(
            height: 32,
            margin: EdgeInsets.fromLTRB(16, 8, 16, 24),
            // child: Text('add time'),
            child: FixedBottomButton(
              text: AppLocalizations.of(context)!
                  .translate("fixed_bottom_update"),
              icon: Qlhk.save_outlined,
              press: () {
                updateListTime();
              },
              height: 32,
              color: Color(0xFF6F9BD4),
              textColor: Colors.white,
              iconDisplay: true,
              iconColor: Colors.white,
              spaceIconText: 4,
            ),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            child: listItem.length > 0
                ? ListView.builder(
                    itemCount: listItem.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: InputSearchHour(
                                      textController: textEditingController,
                                      isShowIcon: false,
                                      iconData: Icons.delete_forever_outlined),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: FixedBottomButton(
                                  text: '',
                                  icon: Icons.search_outlined,
                                  height: 32,
                                  color: Color(0xFF6F9BD4),
                                  press: () {},
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            LineStart(
                                isCheckAll: isCheckAll,
                                onClickIcon: (value) {
                                  _changeState(value);
                                }),
                            HourItemList(
                              isCheck: listItem[index].check.toString(),
                              onItemClick: (ValueChanged) {
                                _changeStateLine(ValueChanged, index);
                              },
                              stt: listItem[index].stt.toString(),
                              tgian: listItem[index].time!,
                            )
                          ],
                        );
                      }
                      return HourItemList(
                        isCheck: listItem[index].check.toString(),
                        onItemClick: (ValueChanged) {
                          _changeStateLine(ValueChanged, index);
                        },
                        stt: listItem[index].stt.toString(),
                        tgian: listItem[index].time.toString(),
                      );
                    })
                : Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: InputSearchHour(
                            textController: textEditingController,
                            isShowIcon: false,
                            iconData: Icons.delete_forever_outlined),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: FixedBottomButton(
                        text: '',
                        icon: Icons.search_outlined,
                        height: 32,
                        color: Color(0xFF6F9BD4),
                        press: () {},
                      )),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void updateListTime() {
    try {
      setState(() {
        widget.time.hourlist = listItem;
      });
      final result=timeViewModel.updateTimeAppointment(widget.time);
      Navigator.of(context).pop(widget.time);
    } catch (e) {
      print(
          '=============================\nloi update hour list' + e.toString());
    }
  }
}
