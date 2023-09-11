import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextItem.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';

import '../../../../../../../components/container/Decoration.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/FreeDay.dart';
import '../DetailFreeday.dart';

class ItemFreeday extends StatelessWidget {
  const ItemFreeday(
      {Key? key,
        required this.freeDay, this.onPressItem})
      : super(key: key);
  final FreeDay freeDay;

  final Function()? onPressItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: GestureDetector(
        onTap: () {
          onPressItem!();
        },
        child: Container(
          decoration: BoxecorationContainer,
          child: Column(
            children: [
              Container(
                height: 35,
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                    color: freeDay.type == '1'
                        ? Color(0xFF6F9BD4)
                        : Color(0xFF5CBBB8),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    freeDay.type == '1'
                        ? AppLocalizations.of(context)!
                        .translate("specific_days_of_the_year")
                        : AppLocalizations.of(context)!
                        .translate("weekly_fixed_days"),
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  children: [
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("freeday"),
                        content: freeDay.type == '1'
                            ? '${freeDay.fromDay} - ${freeDay.toDay}'
                            : freeDay.thu!),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("free_morning"),
                        content: freeDay.freeMorning!
                            ? AppLocalizations.of(context)!
                            .translate("effect")
                            : AppLocalizations.of(context)!
                            .translate("not_effect")),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("free_afternoon"),
                        content: freeDay.freeAfternoon!
                            ? AppLocalizations.of(context)!
                            .translate("effect")
                            : AppLocalizations.of(context)!
                            .translate("not_effect")),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("free_remote"),
                        content: freeDay.freeRemote!
                            ? AppLocalizations.of(context)!
                            .translate("effect")
                            : AppLocalizations.of(context)!
                            .translate("not_effect")),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("free_csyt"),
                        content: freeDay.freeCSYT!
                            ? AppLocalizations.of(context)!
                            .translate("effect")
                            : AppLocalizations.of(context)!
                            .translate("not_effect")),
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