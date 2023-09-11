import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/dialog/ErrorDialog.dart';
import 'package:vncare_qlhk/components/dialog/InputDialog.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/presentation/TimeViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/Times.dart';
import 'EditTime.dart';
import 'ListTime.dart';

class ScheduleDetail extends StatefulWidget {
  ScheduleDetail({Key? key, required this.timeschedule}) : super(key: key);
  final Times timeschedule;

  @override
  State<ScheduleDetail> createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  final TimeViewModel timeViewModel = new TimeViewModel();
  late Times time;

  @override
  void initState() {
    // TODO: implement initState
    time = widget.timeschedule;
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
              .translate("time_appointment_detail"),
          onPress: () {
            Navigator.of(context).pop(time);
          },
        ),
      ),
      body: Scaffold(
        bottomNavigationBar: Container(
            height: 32,
            margin: EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!
                        .translate("fixed_bottom_remove"),
                    icon: Icons.cancel_outlined,
                    press: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialog(
                              title: AppLocalizations.of(context)!
                                  .translate("alert_delete"),
                              buttonText: AppLocalizations.of(context)!
                                  .translate("fixed_bottom_remove"),
                              message:
                              AppLocalizations.of(context)!
                                  .translate("alert_delete_detail"),
                              onPress: () {
                                final result = timeViewModel
                                    .deleteTimeAppointment(time.id!);
                                Navigator.of(context).pop('refresh');
                              },
                            );
                            // return InputDialog();
                          }).then((value) {
                        if (value == 'refresh') {
                          Navigator.of(context).pop('refresh');
                        }
                      });
                    },
                    height: 32,
                    border: true,
                    color: Colors.white,
                    textColor: Color(0xFF6F9BD4),
                    iconDisplay: true,
                    iconColor: Color(0xFF6F9BD4),
                    spaceIconText: 4,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!.translate(
                        "fixed_bottom_button_edit_offline_detail_title"),
                    icon: Qlhk.edit,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditTimeAppointment(
                                    editTimes: time,
                                  ))).then((value) {
                        setState(() {
                          time = value;
                        });
                      });
                    },
                    height: 32,
                    color: Color(0xFF6F9BD4),
                    textColor: Colors.white,
                    iconDisplay: true,
                    iconColor: Colors.white,
                    spaceIconText: 4,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!
                        .translate("detail_time_appointment"),
                    icon: Qlhk.medical,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListHour(time: time))).then((value) {
                                setState(() {
                                  time=value;
                                });
                      });
                    },
                    height: 32,
                    color: Color(0xFF6F9BD4),
                    textColor: Colors.white,
                    iconDisplay: true,
                    iconColor: Colors.white,
                    spaceIconText: 4,
                  ),
                ),
              ],
            )),
        body: Container(
            margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
            padding: EdgeInsets.all(16),
            decoration: BoxecorationContainer,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("state_examination"),
                    content: time.isApply!
                        ? AppLocalizations.of(context)!.translate("isApply")
                        : AppLocalizations.of(context)!.translate("isNotApply"),
                    flexItemLeft: 6,
                    flexItemRight: 4,
                    color2: time.isApply! ? Colors.blue : Colors.red,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("hour_morning_start"),
                    content: time.timeStartAM!,
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("hour_morning_finish"),
                    content: time.timeEndAM!,
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("hour_afternoon_start"),
                    content: time.timeStartPM!,
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("hour_afternoon_finish"),
                    content: time.timeEndPM!,
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("time_per_patient"),
                    content: time.time!,
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("amount_patient_per_time"),
                    content: time.amountPatient!,
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!
                        .translate("type_examination"),
                    content: time.state == 1
                        ? AppLocalizations.of(context)!
                            .translate("examination_on_site")
                        : AppLocalizations.of(context)!
                            .translate("examination_remote"),
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                  RowTextView(
                    lable: AppLocalizations.of(context)!.translate("note"),
                    content: time.note!,
                    flexItemLeft: 6,
                    flexItemRight: 4,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
