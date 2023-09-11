import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/DateButton.dart';
import 'package:vncare_qlhk/components/dropdown/OfflineSearchDropDown.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/presentation/FreeDayViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/dialog/ErrorDialog.dart';
import '../../../../../../components/dropdown/CustomDropDown.dart';
import '../../../../../../components/rowflex/RowTextView.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyDanhMuc/presentation/DetailSpinner.dart';
import '../../quanLyDanhMuc/presentation/Directory.dart';
import '../data/model/FreeDay.dart';
import 'component/ChoosingFreeDay.dart';

class EditFreeDay extends StatefulWidget {
  const EditFreeDay({Key? key, required this.freeDay}) : super(key: key);
  final FreeDay freeDay;

  @override
  State<EditFreeDay> createState() => _EditFreeDayState();
}

class _EditFreeDayState extends State<EditFreeDay> {
  late bool types;
  late bool isMorning;
  late bool isAfternoon;
  late bool isRemote;
  late bool isCSYT;
  late String thu;
  late String rangeHour;
  final FreeDayViewModel freeDayViewModel = new FreeDayViewModel();

  bool validator=false;
  @override
  void initState() {
    super.initState();
    rangeHour = widget.freeDay.fromDay! + ' - ' + widget.freeDay.toDay!;
    types = widget.freeDay.type == '1' ? true : false;
    isMorning = widget.freeDay.freeMorning!;
    isAfternoon = widget.freeDay.freeAfternoon!;
    isRemote = widget.freeDay.freeRemote!;
    isCSYT = widget.freeDay.freeCSYT!;
    thu = widget.freeDay.thu.toString();
  }

  void _showDateRangePicker(BuildContext context) async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      currentDate: DateTime.now(),
      saveText: 'OK',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.black,
              onSurface: Colors.black,
              background: Colors.blue,
              brightness: Brightness.light,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (result != null) {
      print(result.start.toString());
      List<String> beginDate =
          result.start.toString().substring(0, 10).split('-');
      List<String> endDate = result.end.toString().substring(0, 10).split('-');
      setState(() {
        rangeHour = beginDate[2] +
            '/' +
            beginDate[1] +
            '/' +
            beginDate[0] +
            ' - ' +
            endDate[2] +
            '/' +
            endDate[1] +
            '/' +
            endDate[0];
      });
    }
  }

  void editFreeDay() async {
    if ((types && rangeHour.length < 10) || (!types && thu.isEmpty)) {
      setState(() {
        validator=true;
      });
    } else {
      String fromDay = '';
      String toDay = '';
      try {
        fromDay = rangeHour.substring(0, 10);
        toDay = rangeHour.substring(13, 23);
      } catch (e) {
        print('loi convert');
      }
      FreeDay freeDay = FreeDay(
          type: types ? '1' : '0',
          thu: thu,
          fromDay: fromDay,
          toDay: toDay,
          freeMorning: isMorning,
          freeAfternoon: isAfternoon,
          freeRemote: isRemote,
          freeCSYT: isCSYT,
          id: widget.freeDay.id);
      final result = freeDayViewModel.updateFreeday(freeDay);
      Navigator.of(context).pop(freeDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          check: false,
          text: AppLocalizations.of(context)!.translate("edit_freeday"),
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
              editFreeDay();
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
          decoration: BoxecorationContainer,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: CustomDropDown(
                      title: AppLocalizations.of(context)!
                          .translate("type_freeday"),
                      checkRangBuoc: true,
                      value: types
                          ? AppLocalizations.of(context)!
                              .translate("specific_days_of_the_year")
                          : AppLocalizations.of(context)!
                              .translate("weekly_fixed_days"),
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailSpinner(
                                      value1: '35',
                                  titleAppbar: 'loại ngày nghỉ',
                                    ))).then((value) {
                          setState(() {
                            types = (value == 'Ngày cụ thể trong năm')
                                ? true
                                : false;
                          });
                        });
                      },
                      icon: Icons.arrow_drop_down_outlined),
                ),
                Visibility(
                  visible: types ? false : true,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("monday_of_the_week"),
                        value: thu,
                        isError: validator && thu.isEmpty,
                        checkRangBuoc: true,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                    value1: '36',
                                    titleAppbar: 'thứ',
                                  ))).then((value) {
                            setState(() {
                              thu = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                  ),
                ),
                Visibility(
                  visible: types ? true : false,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .translate("from_to_day"),
                                  style: new TextStyle(
                                    color: Color(0xFF535858),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  // textAlign: TextAlign.left,
                                ),
                                TextSpan(
                                  text: ' (*)',
                                  style: TextStyle(color: Colors.red),
                                )
                              ])),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showDateRangePicker(context);
                        },
                        child: DateButton(value: rangeHour,isError: validator && rangeHour.length<10),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: ChoosingFreeDay(
                      isChanged: true,
                      isMorning: isMorning,
                      isAfternoon: isAfternoon,
                      isRemote: isRemote,
                      isCSYT: isCSYT,
                      onClickMorning: (value) {
                        setState(() {
                          isMorning = value;
                        });
                      },
                      onClickAfternoon: (value) {
                        setState(() {
                          isAfternoon = value;
                        });
                      },
                      onClickRemote: (value) {
                        setState(() {
                          isRemote = value;
                        });
                      },
                      onClickCSYT: (value) {
                        setState(() {
                          isCSYT = value;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
