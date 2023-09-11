import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/appbar/CustomAppBar.dart';
import 'package:vncare_qlhk/components/view/EmptyDataView.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/presentation/AddTime.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/presentation/TimeViewModel.dart';

import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/Times.dart';
import 'DetailTime.dart';
import 'component/ItemAppointment.dart';
import 'component/SearchAppointmentItem.dart';

class TimeManage extends StatefulWidget {
  const TimeManage({Key? key}) : super(key: key);

  @override
  State<TimeManage> createState() => _TimeManageState();
}

class _TimeManageState extends State<TimeManage> {
  List<Times> listItem = [];
  List<Times> backupListItem = [];
  bool isLoaded = false;
  final TimeViewModel timeViewModel = new TimeViewModel();

  final _textEdittingControllerMorning = TextEditingController();
  final _textEdittingControllerAfternoon = TextEditingController();
  final _textEdittingControllerTime = TextEditingController();
  final _textEdittingControllerAMount = TextEditingController();
  FocusNode focusNodeSang = FocusNode();
  FocusNode focusNodeChieu = FocusNode();
  FocusNode focusNodeTGian = FocusNode();
  FocusNode focusNodeSL = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          check: false,
          text: AppLocalizations.of(context)!
              .translate("time_appointment_manage"),
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
                      SearchAppointmentItem(
                        textEditingControllerSang:
                            _textEdittingControllerMorning,
                        textEditingControllerChieu:
                            _textEdittingControllerAfternoon,
                        textEditingControllerTgian: _textEdittingControllerTime,
                        textEditingControllerSL: _textEdittingControllerAMount,
                        focusNodeSang: focusNodeSang,
                        focusNodeChieu: focusNodeChieu,
                        focusNodeTgian: focusNodeTGian,
                        focusNodeSL: focusNodeSL,
                        onPressAdd: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddSchedule()))
                              .then((value) {
                            setState(() {
                              listItem.clear();
                              isLoaded = false;
                            });
                            loadData();
                          });
                        },
                        onPressSearch: () {
                          print(_textEdittingControllerMorning.text);
                          print(_textEdittingControllerAfternoon.text);
                          print(_textEdittingControllerTime.text);
                          print(_textEdittingControllerAMount.text);
                        },
                      ),
                      ItemAppointment(
                        time: listItem[index],
                        onPressItem: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScheduleDetail(
                                        timeschedule: listItem[index],
                                      ))).then((value) {
                            if (value == 'refresh') {
                              setState(() {
                                listItem.remove(listItem[index]);
                              });
                            } else
                              updateTimes(value);
                          });
                        },
                      )
                    ],
                  );
                } else {
                  return ItemAppointment(
                    time: listItem[index],
                    onPressItem: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScheduleDetail(
                                    timeschedule: listItem[index],
                                  ))).then((value) {
                        if (value == 'refresh') {
                          setState(() {
                            listItem.remove(listItem[index]);
                          });
                        } else
                          updateTimes(value);
                      });
                    },
                  );
                }
              })
          : Column(
              children: [
                SearchAppointmentItem(
                  textEditingControllerSang: _textEdittingControllerMorning,
                  textEditingControllerChieu: _textEdittingControllerAfternoon,
                  textEditingControllerTgian: _textEdittingControllerTime,
                  textEditingControllerSL: _textEdittingControllerAMount,
                  focusNodeSang: focusNodeSang,
                  focusNodeChieu: focusNodeChieu,
                  focusNodeTgian: focusNodeTGian,
                  focusNodeSL: focusNodeSL,
                  onPressAdd: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddSchedule())).then((value) {
                      setState(() {
                        listItem.clear();
                        isLoaded = false;
                      });
                      loadData();
                    });
                  },
                  onPressSearch: () {
                    print(_textEdittingControllerMorning.text);
                    print(_textEdittingControllerAfternoon.text);
                    print(_textEdittingControllerTime.text);
                    print(_textEdittingControllerAMount.text);
                  },
                ),
                // Expanded(child: Center(child: EmptyDataView()))
                isLoaded ? EmptyDataView() : CircularProgressIndicator()
              ],
            ),
    );
  }

  void loadData() {
    print('vao load data');
    timeViewModel.getAllTimeAppointment();
    timeViewModel.time.listen((data) {
      setState(() {
        isLoaded = true;
        listItem = data;
        backupListItem = data;
        print('load oke');
      });
    });
  }

  void searchTime(List<String> value) {
    listItem = backupListItem;
    List<Times> tmp = [];
    for (int i = 0; i < listItem.length; i++) {
      int hourMorningStart =
          int.parse(listItem[i].timeStartAM![0] + listItem[i].timeStartAM![1]);
      int hourMorningEnd =
          int.parse(listItem[i].timeEndAM![0] + listItem[i].timeEndAM![1]);
      int hourAfternoonStart =
          int.parse(listItem[i].timeStartPM![0] + listItem[i].timeStartPM![1]);
      int hourAfternoonEnd =
          int.parse(listItem[i].timeEndPM![0] + listItem[i].timeEndPM![1]);

      if ((value[0].isNotEmpty &&
              int.parse(value[0]) >= hourMorningStart &&
              int.parse(value[0]) < hourMorningEnd) &&
          (value[1].isNotEmpty &&
              int.parse(value[1]) >= hourAfternoonStart &&
              int.parse(value[1]) < hourAfternoonEnd) &&
          listItem[i].time!.contains(value[2]) &&
          listItem[i].amountPatient!.contains(value[3])) {
        tmp.add(listItem[i]);
      }
    }
    setState(() {
      listItem = tmp;
    });
  }

  void updateTimes(Times value) {
    for (int i = 0; i < listItem.length; i++) {
      if (listItem[i].id == value.id) {
        setState(() {
          listItem[i] = value;
        });
      }
    }
  }
}
