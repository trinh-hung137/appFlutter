import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/container/CustomContain.dart';
import 'package:vncare_qlhk/components/container/DecorationSearch.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';

import '../../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class SearchAppointmentItem extends StatelessWidget {
  SearchAppointmentItem({
    Key? key,
    required this.textEditingControllerSang,
    required this.textEditingControllerChieu,
    required this.textEditingControllerTgian,
    required this.textEditingControllerSL,
    required this.focusNodeSang,
    required this.focusNodeChieu,
    required this.focusNodeTgian,
    required this.focusNodeSL, this.onPressAdd, this.onPressSearch,
  }) : super(key: key);
  final TextEditingController textEditingControllerSang;
  final TextEditingController textEditingControllerChieu;
  final TextEditingController textEditingControllerTgian;
  final TextEditingController textEditingControllerSL;

  final FocusNode focusNodeSang;
  final FocusNode focusNodeChieu;
  final FocusNode focusNodeTgian;
  final FocusNode focusNodeSL;

  final Function()? onPressAdd;
  final Function()? onPressSearch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: BoxecorationContainerSearch,
        margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("range_morning_time"),
                      focusNode: focusNodeSang,
                      onPress: () {
                        textEditingControllerSang.clear();
                      },
                      textEditingController: textEditingControllerSang),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("range_afternoon_time"),
                      focusNode: focusNodeChieu,
                      onPress: () {
                        textEditingControllerChieu.clear();
                      },
                      textEditingController: textEditingControllerChieu),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("time_per_patient"),
                      focusNode: focusNodeTgian,
                      onPress: () {
                        textEditingControllerTgian.clear();
                      },
                      textEditingController: textEditingControllerTgian),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("amount_patient_per_time"),
                      focusNode: focusNodeSL,
                      onPress: () {
                        textEditingControllerSL.clear();
                      },
                      textEditingController: textEditingControllerSL),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!.translate("searching"),
                    icon: Qlhk.search,
                    height: 30,
                    color: Color(0xFF6F9BD4),
                    iconDisplay: true,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    press: () {
                      onPressSearch!();
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!.translate("adding"),
                    icon: Qlhk.add,
                    height: 30,
                    color: Color(0xFF6F9BD4),
                    iconDisplay: true,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    press: () {
                      onPressAdd!();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
