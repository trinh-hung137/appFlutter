import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/presentation/FreeDayViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/dialog/ErrorDialog.dart';
import '../../../../../../qlhk_icons.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/FreeDay.dart';
import 'EditFreeDay.dart';
import 'component/ChoosingFreeDay.dart';

class FreeDayDetail extends StatefulWidget {
  const FreeDayDetail(
      {Key? key, required this.freeDay})
      : super(key: key);
  final FreeDay freeDay;

  @override
  State<FreeDayDetail> createState() => _FreeDayDetailState();
}

class _FreeDayDetailState extends State<FreeDayDetail> {
  late FreeDay freeDay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    freeDay=widget.freeDay;
  }
  @override
  Widget build(BuildContext context) {
    final FreeDayViewModel freeDayViewModel = new FreeDayViewModel();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          check: false,
          text: AppLocalizations.of(context)!
              .translate("detail_freeday"),
          onPress: () {
            Navigator.of(context).pop(freeDay);
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
                        .translate("fixed_bottom_button_edit_offline_detail_title"),
                    icon: Qlhk.edit,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditFreeDay(
                                    freeDay: freeDay,
                                  ))).then((value) {
                                    setState(() {
                                      freeDay=value;
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
                  width: 16,
                ),
                Expanded(
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!
                        .translate("fixed_bottom_remove"),
                    icon: Qlhk.cancel,
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
                                final result =
                                    freeDayViewModel.deleteFreeday(freeDay.id!);
                                Navigator.of(context).pop('refresh');
                              },
                            );
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
                        .translate("type_freeday"),
                    content: freeDay.type == '1'
                        ? AppLocalizations.of(context)!
                        .translate("specific_days_of_the_year")
                        : AppLocalizations.of(context)!
                        .translate("weekly_fixed_days"),
                    flexItemLeft: 1,
                    flexItemRight: 1),
                Visibility(
                  visible: freeDay.type == '1' ? true : false,
                  child: RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("from_day"),
                      content: freeDay.fromDay!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                ),
                Visibility(
                  visible: freeDay.type == '1' ? true : false,
                  child: RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("to_day"),
                      content: freeDay.toDay!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                ),
                Visibility(
                  visible: freeDay.type == '1' ? false : true,
                  child: RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("monday_of_the_week"),
                      content: freeDay.thu!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                ),
                ChoosingFreeDay(
                  isChanged: false,
                  isMorning: freeDay.freeMorning!,
                  isAfternoon: freeDay.freeAfternoon!,
                  isRemote: freeDay.freeRemote!,
                  isCSYT: freeDay.freeCSYT!,
                  onClickMorning: (value) {},
                  onClickAfternoon: (value) {},
                  onClickRemote: (value) {},
                  onClickCSYT: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
