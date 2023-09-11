import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/ButtonCheck.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextItem.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/presentation/TimeViewModel.dart';

import '../../../../../../../components/container/Decoration.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/Times.dart';
import '../DetailTime.dart';

class ItemAppointment extends StatefulWidget {
  const ItemAppointment(
      {Key? key,
      required this.time, this.onPressItem})
      : super(key: key);
  final Times time;
  final Function()? onPressItem;

  @override
  State<ItemAppointment> createState() => _ItemAppointmentState();
}

class _ItemAppointmentState extends State<ItemAppointment> {
  final TimeViewModel timeViewModel = new TimeViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          widget.onPressItem!();
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
          decoration: BoxecorationContainer,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 8, 20, 8),
                height: 37,
                decoration: BoxDecoration(
                    color: widget.time.state == 1
                        ? Color(0xFF6F9BD4)
                        : Color(0xFF5CBBB8),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.time.state == 1
                            ? AppLocalizations.of(context)!
                                .translate("examination_on_site")
                            : AppLocalizations.of(context)!
                                .translate("examination_remote"),
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      ButtonCheck(
                        colorBackground: Colors.white,
                        colorborder: Colors.white,
                        isShowIcon: widget.time.isApply! ? true : false,
                        colorCheck: Color(0xFF6F9BD4),
                        onCLick: () {
                          setState(() {
                            widget.time.isApply =
                                widget.time.isApply! ? false : true;
                          });
                          final result =
                              timeViewModel.updateTimeAppointment(widget.time);
                        },
                      )
                    ]),
              ),
              Container(
                // margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  children: [
                    RowTextItem(
                      lable: AppLocalizations.of(context)!
                          .translate("state_examination"),
                      content: widget.time.isApply!
                          ? AppLocalizations.of(context)!.translate("isApply")
                          : AppLocalizations.of(context)!
                              .translate("isNotApply"),
                      colorContent:
                          widget.time.isApply! ? Colors.blue : Colors.red,
                    ),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("range_morning_time"),
                        content: '${widget.time.timeStartAM}'
                            " - "
                            '${widget.time.timeEndAM}'),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("range_afternoon_time"),
                        content: '${widget.time.timeStartPM}'
                            " - "
                            '${widget.time.timeEndPM}'),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("time_per_patient"),
                        content: widget.time.time!),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!.translate("note"),
                        content: widget.time.note!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
