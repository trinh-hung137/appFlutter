import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/dropdown/CustomDropDown.dart';
import 'package:vncare_qlhk/components/inputfieldform/TextArea.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/dialog/ErrorDialog.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyDanhMuc/presentation/DetailSpinner.dart';
import '../../quanLyDanhMuc/presentation/Directory.dart';
import '../data/model/Times.dart';
import 'DetailTime.dart';
import 'TimeViewModel.dart';

class EditTimeAppointment extends StatefulWidget {
  const EditTimeAppointment({Key? key, required this.editTimes})
      : super(key: key);
  final Times editTimes;

  @override
  State<EditTimeAppointment> createState() => _EditTimeAppointmentState();
}

class _EditTimeAppointmentState extends State<EditTimeAppointment> {
  late final _textEditingController;
  late String timeStartAM;
  late String timeEndAM;
  late String timeStartPM;
  late String timeEndPM;
  late String time;
  late String amountPatient;
  late String note;
  late int state;
  late bool isApply;
  final TimeViewModel timeViewModel = new TimeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController(text: widget.editTimes.note);
    timeStartAM = widget.editTimes.timeStartAM!;
    timeEndAM = widget.editTimes.timeEndAM!;
    timeStartPM = widget.editTimes.timeStartPM!;
    timeEndPM = widget.editTimes.timeEndPM!;
    time = widget.editTimes.time!;
    amountPatient = widget.editTimes.amountPatient!;
    note = widget.editTimes.note!;
    state = widget.editTimes.state!;
  }

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
            text: AppLocalizations.of(context)!
                .translate("time_appointment_edit"),
            onPress: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Scaffold(
          bottomNavigationBar: Container(
            height: 32,
            margin: EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: FixedBottomButton(
              text: AppLocalizations.of(context)!.translate("save"),
              icon: Qlhk.save_outlined,
              press: () {
                updateTime();
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
            margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
            padding: EdgeInsets.all(16),
            decoration: BoxecorationContainer,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomDropDown(
                      title: AppLocalizations.of(context)!
                          .translate("hour_morning_start_less"),
                      value: timeStartAM,
                      checkRangBuoc: true,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '25',
                                  titleAppbar: 'TGBD sáng',
                                    ))).then((value) {
                          setState(() {
                            timeStartAM = value;
                          });
                        });
                      },
                      icon: Icons.arrow_drop_down_outlined),
                  CustomDropDown(
                      title: AppLocalizations.of(context)!
                          .translate("hour_morning_finish_less"),
                      value: timeEndAM,
                      checkRangBuoc: true,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '26',
                                  titleAppbar: 'TGKT sáng',
                                    ))).then((value) {
                          setState(() {
                            timeEndAM = value;
                          });
                        });
                      },
                      icon: Icons.arrow_drop_down_outlined),
                  CustomDropDown(
                      title: AppLocalizations.of(context)!
                          .translate("hour_afternoon_start_less"),
                      value: timeStartPM,
                      checkRangBuoc: true,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '27',
                                  titleAppbar: 'TGBD chiều',
                                    ))).then((value) {
                          setState(() {
                            timeStartPM = value;
                          });
                        });
                      },
                      icon: Icons.arrow_drop_down_outlined),
                  CustomDropDown(
                      title: AppLocalizations.of(context)!
                          .translate("hour_afternoon_finish_less"),
                      value: timeEndPM,
                      checkRangBuoc: true,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '28',
                                  titleAppbar: 'TGKT chiều',
                                    ))).then((value) {
                          setState(() {
                            timeEndPM = value;
                          });
                        });
                      },
                      icon: Icons.arrow_drop_down_outlined),
                  CustomDropDown(
                      title: AppLocalizations.of(context)!
                          .translate("time_per_patient"),
                      value: time,
                      checkRangBuoc: true,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '29',
                                  titleAppbar: 'TG/ bệnh nhân',
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
                      value: amountPatient,
                      checkRangBuoc: true,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '30',
                                  titleAppbar: 'SL bệnh nhân',
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
                      checkRangBuoc: true,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '31',
                                  titleAppbar: 'loại khám',
                                    ))).then((value) {
                          setState(() {
                            state = (value == 'Khám tại cơ sở') ? 1 : 0;
                          });
                        });
                      },
                      value: state == 1
                          ? AppLocalizations.of(context)!
                              .translate("examination_on_site")
                          : AppLocalizations.of(context)!
                              .translate("examination_remote"),
                      icon: Icons.arrow_drop_down_outlined),
                  TextArea(
                    title: AppLocalizations.of(context)!.translate("note"),
                    textController: _textEditingController,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateTime() async {
    String hour1 = timeStartAM[0] + timeStartAM[1];
    String hour2 = timeEndAM[0] + timeEndAM[1];
    String hour3 = timeStartPM[0] + timeStartPM[1];
    String hour4 = timeEndPM[0] + timeEndPM[1];
    if (int.parse(hour1) > int.parse(hour2) ||
        int.parse(hour3) > int.parse(hour4)) {
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
      String note = _textEditingController.text;
      List<String> listTime = setListForListHour(
          timeStartAM.substring(0, 2),
          timeEndAM.substring(0, 2),
          timeStartPM.substring(0, 2),
          timeEndPM.substring(0, 2));
      List<Hourlist> listHourList = [];
      for (int i = 1; i <= listTime.length; i++) {
        listHourList.add(Hourlist(
            stt: i, time: listTime[i - 1], check: true, id: i.toString()));
      }
      Times newTimes = Times(
          time: time,
          hourlist: listHourList,
          isApply: widget.editTimes.isApply,
          state: state,
          note: note,
          amountPatient: amountPatient,
          timeEndPM: timeEndPM,
          timeStartPM: timeStartPM,
          timeEndAM: timeEndAM,
          timeStartAM: timeStartAM,
          id: widget.editTimes.id);
      try {
        final result = timeViewModel.updateTimeAppointment(newTimes);
        Navigator.of(context).pop(newTimes);
      } catch (e) {
        print('===============\nloi update: ' + e.toString());
      }
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
