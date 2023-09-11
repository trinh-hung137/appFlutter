import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/dropdown/OfflineSearchDropDown.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';

import '../../../../../../components/container/DecorationSearch.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../../../../setting/main/presentation/quanLyDanhMuc/presentation/DetailSpinner.dart';

class ContainManageCaculator extends StatefulWidget {
  final void Function(Map<String, String> resultTimKiem) sentData;
  const ContainManageCaculator({
    Key? key,
    required this.sentData,
  }): super(key: key);

  @override
  State<ContainManageCaculator> createState() => _ContainManageCaculatorState();
}

class _ContainManageCaculatorState extends State<ContainManageCaculator> {
  //biến lưu id được chọn
  late String idSelected;
  //biến lưu kqua trả về từ listDrop
  Map<String, String> kqua = {};
  //biến lưu kqua để truyền về manageCaculator
  Map<String,String> dataSearch = {"idPay" : "","idRegistry" : "", "idState" : "" ,"idStatus" : "","tuNgay":"", "denNgay":""};

  //lưu id được chọn
  void setStatus(String id) {
    setState(() {
      idSelected = id;
    });
  }

  DateTimeRange dateTimeRange =
  DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    final width_screen = MediaQuery.of(context).size.width;

    //hàm truyền id sang droplist
    void tranfer(String titleAppbar) async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailSpinner(value1: idSelected,titleAppbar: titleAppbar,)),
      );
      if (result != null) {
        print('Kết quả trả về từ dropdown -> Kết quả = $result');
        setState(() {
          dataSearch[idSelected]= result;
        });

      }
    }

    // final height_screen = MediaQuery.of(context).size.height;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxecorationContainerSearch,
        margin: EdgeInsets.only(top: 8,left: 16,right: 16),
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfflineSearchDropDown(title: AppLocalizations.of(context)!.translate('from_date_to_date'), value:'${formatDate(dateTimeRange.start, [
              dd,
              '/',
              mm,
              '/',
              yyyy
            ])} - ${formatDate(dateTimeRange.end, [
              dd,
              '/',
              mm,
              '/',
              yyyy
            ])}', icon: Qlhk.calendar,onPress: (){
              _show();
            },),
            // SizedBox(height: 8),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: OfflineSearchDropDown(title:  AppLocalizations.of(context)!.translate('pay_fee'), value: dataSearch["idPay"]!, icon: Icons.arrow_drop_down,onPress: (){
                        setStatus('42');
                        tranfer('đóng phí');
                      },)
                    ),
                    // SizedBox(
                    //   width: 16,
                    // ),
                    Expanded(
                      flex: 2,
                      child: OfflineSearchDropDown(title: AppLocalizations.of(context)!.translate('register_channel'), value: dataSearch["idRegistry"]!, icon: Icons.arrow_drop_down,onPress: (){
                        setStatus('43');
                        tranfer('kênh đăng ký');
                      },)
                    ),
                  ],
                )),
            // SizedBox(height: 8),
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: OfflineSearchDropDown(title:  AppLocalizations.of(context)!.translate('status'), value: dataSearch["idState"]!, icon: Icons.arrow_drop_down,onPress: (){
                        setStatus('44');
                        tranfer('trạng thái');
                      },)
                    ),
                    // SizedBox(
                    //   width: 16,
                    // ),
                    Expanded(
                      flex: 2,
                      child: OfflineSearchDropDown(title: AppLocalizations.of(context)!.translate('appointment_status'), value: dataSearch["idStatus"]!, icon: Icons.arrow_drop_down,onPress: (){
                        setStatus('45');
                        tranfer('trạng thái đến khám');
                      },)
                    ),
                  ],
                )),
            // SizedBox(height: 16),
            Container(
              width: width_screen,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(width: 8,),
                    Expanded(
                      flex: 2,
                      child: FixedBottomButton(text: AppLocalizations.of(context)!.translate('search_guide'), icon: Qlhk.search, height: 32,press: (){
                      widget.sentData(dataSearch);
                      },)

                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 2,
                      child: FixedBottomButton(text: AppLocalizations.of(context)!.translate('adding'), icon: Qlhk.add, height: 32,press: (){
                      },)),
                    SizedBox(width: 8,),
                  ]),

            )
          ],
        ));
  }

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023, 5, 1),
      lastDate: DateTime(2023, 8, 30),
      currentDate: DateTime.now(),
      saveText: 'OK',
      initialDateRange: dateTimeRange,
      locale: const Locale('vi'),
    );
    if (result != null) {
      // Rebuild the UI

      print(result.start.toString());
      print(result.end.toString());
      setState(() {
        dateTimeRange = result;
        dataSearch['tuNgay'] = '${formatDate(dateTimeRange.start, [
          yyyy,
          mm,
          dd,
        ])}';
        dataSearch['denNgay'] = '${formatDate(dateTimeRange.end, [yyyy, mm, dd])}';
      });
    }
  }
}
