import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/dialog/InputDialog.dart';
import 'package:vncare_qlhk/components/dialog/SelectPopup.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/presentation/DetailSpinner.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/dialog/ErrorDialog.dart';
import '../../../../../../components/dropdown/CustomDropDown.dart';
import '../../../../../../components/inputfieldform/TextArea.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyDanhMuc/presentation/Directory.dart';
import '../data/model/Times.dart';
import 'TimeViewModel.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  State<AddSchedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<AddSchedule> {
  final _textEditingController = TextEditingController();
  String timeBeginAM = '';
  String timeFinishAM = '';
  String timeBeginPM = '';
  String timeFinishPM = '';
  String time = '';
  String amountPatient = '';
  String type = '';
  List<Hourlist> listHour = [];
  final TimeViewModel timeViewModel = new TimeViewModel();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            check: false,
            text: AppLocalizations.of(context)!.translate("add_appointment"),
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
              text: AppLocalizations.of(context)!.translate("save"),
              icon: Icons.save_alt_outlined,
              press: () {
                addTime();
              },
              height: 32,
              color: Color(0xFF6F9BD4),
              textColor: Colors.white,
              iconDisplay: true,
              iconColor: Colors.white,
              spaceIconText: 4,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
                  padding: EdgeInsets.all(16),
                  decoration: BoxecorationContainer,
                  child: Column(
                    children: [
                      CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("hour_morning_start_less"),
                          checkRangBuoc: true,
                          value: timeBeginAM,
                          isError: validate && timeBeginAM.isEmpty,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSpinner(
                                          value1: '25',
                                      titleAppbar: 'TGBD sáng',
                                        ))).then((value) {
                              setState(() {
                                timeBeginAM = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                      CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("hour_morning_finish_less"),
                          checkRangBuoc: true,
                          value: timeFinishAM,
                          isError: validate && timeFinishAM.isEmpty,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSpinner(
                                          value1: '26',
                                      titleAppbar: 'TGKT sáng',
                                        ))).then((value) {
                              setState(() {
                                timeFinishAM = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                      CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("hour_afternoon_start_less"),
                          checkRangBuoc: true,
                          value: timeBeginPM,
                          isError: validate && timeBeginPM.isEmpty,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSpinner(
                                          value1: '27',
                                      titleAppbar: 'TGBD chiều',
                                        ))).then((value) {
                              setState(() {
                                timeBeginPM = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                      CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("hour_afternoon_finish_less"),
                          checkRangBuoc: true,
                          value: timeFinishPM,
                          isError: validate && timeFinishPM.isEmpty,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSpinner(
                                          value1: '28',
                                      titleAppbar: 'TGKT chiều',
                                        ))).then((value) {
                              setState(() {
                                timeFinishPM = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                      CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("time_per_patient"),
                          checkRangBuoc: true,
                          value: time,
                          isError: validate && time.isEmpty,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSpinner(
                                          value1: '29',
                                      titleAppbar: 'TG/ bênh nhân',
                                        ))).then((value) {
                              setState(() {
                                time = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                      CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("amount_patient_per_time"),
                          checkRangBuoc: true,
                          value: amountPatient,
                          isError: validate && amountPatient.isEmpty,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSpinner(
                                          value1: '30',
                                      titleAppbar: 'SLBN',
                                        ))).then((value) {
                              setState(() {
                                amountPatient = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                      CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("type_examination"),
                          value: type,
                          checkRangBuoc: true,
                          isError: validate && type.isEmpty,
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailSpinner(
                                          value1: '31',
                                      titleAppbar: 'loại khám',
                                        ))).then((value) {
                              setState(() {
                                type = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                      TextArea(
                        title: AppLocalizations.of(context)!.translate("note"),
                        textController: _textEditingController,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTime() async {
    if (timeBeginAM.isEmpty ||
        timeFinishAM.isEmpty ||
        timeBeginPM.isEmpty ||
        timeFinishPM.isEmpty ||
        time.isEmpty ||
        amountPatient.isEmpty ||
        type.isEmpty) {
      setState(() {
        validate = true;
      });
    } else if (int.parse(timeBeginAM[0] + timeBeginAM[1]) >
            int.parse(timeFinishAM[0] + timeFinishAM[1]) ||
        int.parse(timeBeginPM[0] + timeBeginPM[1]) >
            int.parse(timeFinishPM[0] + timeFinishPM[1])) {
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(
              onPress: () {
                Navigator.pop(context);
              },
              icon: Icons.delete_forever_outlined,
              title: 'Lỗi nhập liệu',
              message: 'Thời gian nhập liệu không hợp lệ',
              buttonText: 'OK',
            );
          });
    } else {
      List<String> listTime = setListForListHour(
          timeBeginAM.substring(0, 2),
          timeFinishAM.substring(0, 2),
          timeBeginPM.substring(0, 2),
          timeFinishPM.substring(0, 2));
      List<Hourlist> listHourList = [];
      for (int i = 1; i <= listTime.length; i++) {
        listHourList.add(Hourlist(
            stt: i, time: listTime[i - 1], check: true, id: i.toString()));
      }
      Times times = Times(
        timeStartAM: timeBeginAM,
        timeEndAM: timeFinishAM,
        timeStartPM: timeBeginPM,
        timeEndPM: timeFinishPM,
        time: time,
        amountPatient: amountPatient,
        note: _textEditingController.text.toString(),
        state: type == 'Khám tại cơ sở' ? 1 : 0,
        isApply: true,
        hourlist: listHourList,
      );
      try {
        timeViewModel.addTimeAppointment(times);
        timeViewModel.addTime.listen((event) {
          Navigator.of(context).pop();
        });
      } catch (e) {}

    }
  }

  List<String> setListForListHour(String timeBeginAM, String timeFinishAM,
      String timeBeginPM, String timeFinishPM) {
    List<String> timeList = [];
    int startHour1 = int.parse(timeBeginAM);
    int endHour1 = int.parse(timeFinishAM);
    int intervalMinutes = 5;

    for (int hour = startHour1; hour < endHour1; hour++) {
      for (int minute = 0; minute < 60; minute += intervalMinutes) {
        String hourString = hour.toString().padLeft(2, '0');
        String minuteString = minute.toString().padLeft(2, '0');
        timeList.add('$hourString:$minuteString');
      }
    }
    int startHour2 = int.parse(timeBeginPM);
    int endHour2 = int.parse(timeFinishPM);

    for (int hour = startHour2; hour < endHour2; hour++) {
      for (int minute = 0; minute < 60; minute += intervalMinutes) {
        String hourString = hour.toString().padLeft(2, '0');
        String minuteString = minute.toString().padLeft(2, '0');
        timeList.add('$hourString:$minuteString');
      }
    }
    print(timeList.toString());
    return timeList;
  }
}
