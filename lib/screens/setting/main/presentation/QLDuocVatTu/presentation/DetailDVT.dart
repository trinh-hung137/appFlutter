import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/ButtonCheck.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/presentation/DVTViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/dialog/ErrorDialog.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/DVT.dart';
import 'EditDVT.dart';

class ChiTietDuocVatTu extends StatefulWidget {
  const ChiTietDuocVatTu({Key? key, required this.dvt}) : super(key: key);
  final DuocVatTu dvt;

  @override
  State<ChiTietDuocVatTu> createState() => _ChiTietDuocVatTuState();
}

class _ChiTietDuocVatTuState extends State<ChiTietDuocVatTu> {
  late DuocVatTu duocVatTu;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duocVatTu=widget.dvt;
  }
  @override
  Widget build(BuildContext context) {
    final DVTViewModel dvtViewModel = new DVTViewModel();
    bool sd = duocVatTu.sudung!;
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          check: false,
          text: AppLocalizations.of(context)!
              .translate("medical_detail"),
          onPress: () {
            Navigator.of(context).pop(duocVatTu);
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
                              builder: (context) => EditDVT(dvt: duocVatTu))).then((value) {
                                setState(() {
                                  duocVatTu=value;
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
                                final result=dvtViewModel.deleteDuocVatTu(duocVatTu.id!);
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
                          .translate("medical_id"),
                      content: duocVatTu.ma!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("medical_name"),
                      content: duocVatTu.ten!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("registration_number"),
                      content: duocVatTu.sdk!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("decisions_number"),
                      content: duocVatTu.sqd!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("active_ingredient_registration_number"),
                      content: duocVatTu.hcsdk!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("content"),
                      content: duocVatTu.hamluong!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("medical_ingredient"),
                      content: duocVatTu.hoatchat!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("oral_route"),
                      content: duocVatTu.duongdung!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("allocation_units"),
                      content: duocVatTu.dvcapphat!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("packed"),
                      content: duocVatTu.donggoi!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("manufacturers"),
                      content: duocVatTu.hangsx!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  RowTextView(
                      lable: AppLocalizations.of(context)!
                          .translate("country_of_manufacture"),
                      content: duocVatTu.nuocsx!,
                      flexItemLeft: 1,
                      flexItemRight: 1),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            AppLocalizations.of(context)!
                                .translate("status_use"),
                        style: new TextStyle(
                          color: Color(0xFF535858),
                          fontSize: 14,
                        ),
                      )),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ButtonCheck(
                              colorBackground: Color(0xFFCBCBCB),
                              colorborder: Color(0xFF4F82C2),
                              isShowIcon: sd ? true : false,
                              colorCheck: Color(0xFF4F82C2)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
