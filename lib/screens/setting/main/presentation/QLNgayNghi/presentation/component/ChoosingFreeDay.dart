import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/ButtonCheck.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';

import '../../../../../../../utils/AppLocalizations.dart';

class ChoosingFreeDay extends StatelessWidget {
  const ChoosingFreeDay(
      {Key? key,
        required this.isMorning,
        required this.isAfternoon,
        required this.isRemote,
        required this.isCSYT,
        required this.onClickMorning,
        required this.onClickAfternoon,
        required this.onClickRemote,
        required this.onClickCSYT,
        required this.isChanged})
      : super(key: key);

  final bool isMorning;
  final bool isAfternoon;
  final bool isRemote;
  final bool isCSYT;
  final Function(bool) onClickMorning;
  final Function(bool) onClickAfternoon;
  final Function(bool) onClickRemote;
  final Function(bool) onClickCSYT;
  final bool isChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(AppLocalizations.of(context)!
              .translate("free_part")),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/6,8,0,0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  isChanged?onClickMorning(!isMorning):null;
                },
                child: Row(
                  children: [
                    ButtonCheck(
                        onCLick: (){
                          isChanged?onClickMorning(!isMorning):null;
                        },
                        colorBackground: isChanged?Colors.white:Color(0xFFCBCBCB),
                        colorborder: Color(0xFF6F9BD4),
                        isShowIcon: isMorning,
                        colorCheck: Color(0xFF6F9BD4)),
                    SizedBox(width: 4,),
                    Text(AppLocalizations.of(context)!
                        .translate("free_morning"), style: TextStyle(fontSize: 14))
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  isChanged?onClickAfternoon(!isAfternoon):null;
                },
                child: Row(
                  children: [
                    ButtonCheck(
                        onCLick: (){isChanged?onClickAfternoon(!isAfternoon):null;},
                        colorBackground: isChanged?Colors.white:Color(0xFFCBCBCB),
                        colorborder: Color(0xFF6F9BD4),
                        isShowIcon: isAfternoon,
                        colorCheck: Color(0xFF6F9BD4)),
                    SizedBox(width: 4,),
                    Text(AppLocalizations.of(context)!
                        .translate("free_afternoon"), style: TextStyle(fontSize: 14))
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(AppLocalizations.of(context)!
              .translate("free_service")),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/6,8,0,0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  isChanged?onClickRemote(!isRemote):null;
                },
                child: Row(
                  children: [
                    ButtonCheck(
                        onCLick: (){isChanged?onClickRemote(!isRemote):null;},
                        colorBackground: isChanged?Colors.white:Color(0xFFCBCBCB),
                        colorborder: Color(0xFF6F9BD4),
                        isShowIcon: isRemote,
                        colorCheck: Color(0xFF6F9BD4)),
                    SizedBox(width: 4,),
                    Text(
                      AppLocalizations.of(context)!
                          .translate("free_remote"),
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              SizedBox(height: 8,),
              GestureDetector(
                onTap: () {
                  isChanged?onClickCSYT(!isCSYT):null;
                },
                child: Row(
                  children: [
                    ButtonCheck(
                        onCLick: (){isChanged?onClickCSYT(!isCSYT):null;},
                        colorBackground: isChanged?Colors.white:Color(0xFFCBCBCB),
                        colorborder: Color(0xFF6F9BD4),
                        isShowIcon: isCSYT,
                        colorCheck: Color(0xFF6F9BD4)),
                    SizedBox(width: 4,),
                    Text(AppLocalizations.of(context)!
                        .translate("free_csyt"), style: TextStyle(fontSize: 14))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}