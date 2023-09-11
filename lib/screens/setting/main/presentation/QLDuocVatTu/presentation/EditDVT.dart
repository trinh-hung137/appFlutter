import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/dropdown/CustomDropDown.dart';
import 'package:vncare_qlhk/components/inputfieldform/RowTextField.dart';
import 'package:vncare_qlhk/components/inputfieldform/TextArea.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/presentation/DVTViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/ButtonCheck.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/dialog/ErrorDialog.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyDanhMuc/presentation/DetailSpinner.dart';
import '../../quanLyDanhMuc/presentation/Directory.dart';
import '../data/model/DVT.dart';

class EditDVT extends StatefulWidget {
  const EditDVT({Key? key, required this.dvt}) : super(key: key);

  final DuocVatTu dvt;

  @override
  State<EditDVT> createState() => _EditDVTState();
}

class _EditDVTState extends State<EditDVT> {
  late final _textEditingControllerMa;
  late final _textEditingControllerTen;
  late final _textEditingControllerSDK;
  late final _textEditingControllerSQD;
  late final _textEditingControllerHCSDK;
  late final _textEditingControllerHamLuong;
  late final _textEditingControllerDongGoi;
  late final _textEditingControllerHangSX;
  late final _textEditingControllerNuocSX;
  late bool isUsed;
  final DVTViewModel dvtViewModel = new DVTViewModel();
  bool validator = false;

  @override
  void initState() {
    // TODO: implement initState
    _textEditingControllerMa = TextEditingController(text: widget.dvt.ma);
    _textEditingControllerTen = TextEditingController(text: widget.dvt.ten);
    _textEditingControllerSDK = TextEditingController(text: widget.dvt.sdk);
    _textEditingControllerSQD = TextEditingController(text: widget.dvt.sqd);
    _textEditingControllerHCSDK = TextEditingController(text: widget.dvt.hcsdk);
    _textEditingControllerHamLuong =
        TextEditingController(text: widget.dvt.hamluong);
    _textEditingControllerDongGoi =
        TextEditingController(text: widget.dvt.donggoi);
    _textEditingControllerHangSX =
        TextEditingController(text: widget.dvt.hangsx);
    _textEditingControllerNuocSX =
        TextEditingController(text: widget.dvt.nuocsx);
    isUsed = widget.dvt.sudung!;
  }

  @override
  Widget build(BuildContext context) {
    void saveDataDVT() async {
      String ma = _textEditingControllerMa.text;
      String ten = _textEditingControllerTen.text;
      String sdk = _textEditingControllerSDK.text;
      String sqd = _textEditingControllerSQD.text;
      String hcsdk = _textEditingControllerHCSDK.text;
      String hamluong = _textEditingControllerHamLuong.text;
      String donggoi = _textEditingControllerDongGoi.text;
      String hangsx = _textEditingControllerHangSX.text;
      String nuocsx = _textEditingControllerNuocSX.text;
      bool? sudung = isUsed;
      if (ma.isEmpty ||
          ten.isEmpty ||
          donggoi.isEmpty ||
          hangsx.isEmpty ||
          nuocsx.isEmpty) {
        setState(() {
          validator = true;
        });
      } else {
        print('=====================\nvao update\n');
        DuocVatTu dvt = DuocVatTu(
            ma: ma,
            ten: ten,
            sdk: sdk,
            sqd: sqd,
            hcsdk: hcsdk,
            hamluong: hamluong,
            hoatchat: widget.dvt.hoatchat,
            duongdung: widget.dvt.duongdung,
            dvcapphat: widget.dvt.dvcapphat,
            donggoi: donggoi,
            hangsx: hangsx,
            nuocsx: nuocsx,
            sudung: sudung,
            id: widget.dvt.id);
        try {
          final result = dvtViewModel.updateDuocVatTu(dvt);
          Navigator.of(context).pop(dvt);
        } catch (e) {
          print('=================\nco loi update dvt: ' + e.toString());
        }
      }
      // print(sudung.toString());
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            check: false,
            text: AppLocalizations.of(context)!.translate("medical_edit"),
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
                saveDataDVT();
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
              padding: EdgeInsets.all(16),
              decoration: BoxecorationContainer,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    RowTextField(
                      title:
                          AppLocalizations.of(context)!.translate("medical_id"),
                      checkRangBuoc: true,
                      onChanged: (value) {
                        setState(() {});
                      },
                      isError:
                          validator && _textEditingControllerMa.text.isEmpty,
                      textController: _textEditingControllerMa,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                      title: AppLocalizations.of(context)!
                          .translate("medical_name"),
                      checkRangBuoc: true,
                      onChanged: (value) {
                        setState(() {});
                      },
                      isError:
                          validator && _textEditingControllerTen.text.isEmpty,
                      textController: _textEditingControllerTen,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                      title: AppLocalizations.of(context)!
                          .translate("registration_number"),
                      textController: _textEditingControllerSDK,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                      title: AppLocalizations.of(context)!
                          .translate("decisions_number"),
                      textController: _textEditingControllerSQD,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                      title: AppLocalizations.of(context)!
                          .translate("active_ingredient_registration_number"),
                      textController: _textEditingControllerHCSDK,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("content"),
                      textController: _textEditingControllerHamLuong,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("medical_ingredient"),
                        value: widget.dvt.hoatchat!,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                        value1: '32',
                                    titleAppbar: 'hoạt chất',
                                      ))).then((value) {
                            setState(() {
                              widget.dvt.hoatchat = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                    CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("oral_route"),
                        value: widget.dvt.duongdung!,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                        value1: '33',
                                    titleAppbar: 'đường dùng',
                                      ))).then((value) {
                            setState(() {
                              widget.dvt.duongdung = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                    CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("allocation_units"),
                        value: widget.dvt.dvcapphat!,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                        value1: '34',
                                    titleAppbar: 'đơn vị cấp phát',
                                      ))).then((value) {
                            setState(() {
                              widget.dvt.dvcapphat = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                    SizedBox(height: 8,),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("packed"),
                      checkRangBuoc: true,
                      onChanged: (value) {
                        setState(() {});
                      },
                      isError: _textEditingControllerDongGoi.text.isEmpty,
                      textController: _textEditingControllerDongGoi,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                      title: AppLocalizations.of(context)!
                          .translate("manufacturers"),
                      checkRangBuoc: true,
                      onChanged: (value) {
                        setState(() {});
                      },
                      isError: validator &&
                          _textEditingControllerHangSX.text.isEmpty,
                      textController: _textEditingControllerHangSX,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                      title: AppLocalizations.of(context)!
                          .translate("country_of_manufacture"),
                      checkRangBuoc: true,
                      onChanged: (value) {
                        setState(() {});
                      },
                      isError: validator &&
                          _textEditingControllerNuocSX.text.isEmpty,
                      textController: _textEditingControllerNuocSX,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate("status_use"),
                              style: new TextStyle(
                                color: Color(0xFF535858),
                                fontSize: 14,
                              ),
                            )),
                        Expanded(
                          flex: 6,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: ButtonCheck(
                                onCLick: () {
                                  setState(() {
                                    isUsed = !isUsed;
                                  });
                                },
                                colorBackground: Colors.white,
                                colorborder: Color(0xFF4F82C2),
                                isShowIcon: isUsed,
                                colorCheck: Color(0xFF4F82C2)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
