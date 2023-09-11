import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/presentation/FreeDayViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/DateButton.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/dropdown/CustomDropDown.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyDanhMuc/presentation/DetailSpinner.dart';
import '../data/model/FreeDay.dart';
import 'component/ChoosingFreeDay.dart';

class AddFreeDay extends StatefulWidget {
  const AddFreeDay({Key? key}) : super(key: key);

  @override
  State<AddFreeDay> createState() => _AddFreeDayState();
}

class _AddFreeDayState extends State<AddFreeDay> {
  String type = '';
  String day = '';
  bool isMorning = false;
  bool isAfternoon = false;
  bool isRemote = false;
  bool isCSYT = false;
  String rangeHour = '';
  bool validator=false;
  DateTimeRange selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  FreeDayViewModel freeDayViewModel=new FreeDayViewModel();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          check: false,
          text: AppLocalizations.of(context)!
              .translate("add_freeday"),
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
            text: AppLocalizations.of(context)!
                .translate("save"),
            icon: Icons.save_alt_outlined,
            press: () {
              addFreeday();
            },
            height: 32,
            color: Color(0xFF6F9BD4),
            textColor: Colors.white,
            iconDisplay: true,
            iconColor: Colors.white,
            spaceIconText: 4,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
              decoration: BoxecorationContainer,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("type_freeday"),
                        checkRangBuoc: true,
                        isError: validator && type.isEmpty,
                        value: type,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                    value1: '35',
                                    titleAppbar: 'loại ngày nghỉ',
                                  ))).then((value) {
                            setState(() {
                              type = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                  ),
                  Visibility(
                    visible: type == "Ngày cụ thể trong năm" ? false : true,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("monday_of_the_week"),
                          value: day,
                          isError: validator && day.isEmpty,
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
                                day = value;
                              });
                            });
                          },
                          icon: Icons.arrow_drop_down_outlined),
                    ),
                  ),
                  Visibility(
                    visible: type == "Ngày cố định hàng tuần" ? false : true,
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
                          child: DateButton(value: rangeHour,isError: validator && rangeHour.isEmpty),
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
                      onClickCSYT: (value) {
                        setState(() {
                          isCSYT = value;
                        });
                      },
                      onClickRemote: (value) {
                        setState(() {
                          isRemote = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void addFreeday() async {
    String fromDay = '';
    String toDay = '';
    String dayy = '';
    if (type.isEmpty ||
        (type == 'Ngày cụ thể trong năm' && rangeHour.isEmpty) ||
        (type == 'Ngày cố định hàng tuần' && day.isEmpty)) {
      setState(() {
        validator=true;
      });
    } else {
      dayy = day;
      try {
        fromDay = rangeHour.substring(0, 10);
        toDay = rangeHour.substring(13, 23);
      } catch (e) {
        print('loi convert ngay');
      }
      FreeDay freeDay = FreeDay(
                type: type == "Ngày cụ thể trong năm" ? "1" : "0",
                thu: day,
                fromDay: fromDay,
                toDay: toDay,
                freeAfternoon: isAfternoon,
                freeCSYT: isCSYT,
                freeMorning: isMorning,
                freeRemote: isRemote,
                );
      final result= freeDayViewModel.addFreeday(freeDay);
      freeDayViewModel.addday.listen((event) {
        Navigator.of(context).pop();
      });
    }
  }
}
