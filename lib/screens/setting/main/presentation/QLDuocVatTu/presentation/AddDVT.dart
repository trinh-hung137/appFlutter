import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/dropdown/CustomDropDown.dart';
import 'package:vncare_qlhk/components/inputfieldform/RowTextField.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/presentation/DVTViewModel.dart';
import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/ButtonCheck.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyDanhMuc/presentation/DetailSpinner.dart';
import '../data/model/DVT.dart';

class AddDVT extends StatefulWidget {
  const AddDVT({Key? key}) : super(key: key);

  @override
  State<AddDVT> createState() => _AddDVTState();
}

class _AddDVTState extends State<AddDVT> {
  late final _textEditingControllerMa = TextEditingController();
  late final _textEditingControllerTen = TextEditingController();
  late final _textEditingControllerSDK = TextEditingController();
  late final _textEditingControllerSQD = TextEditingController();
  late final _textEditingControllerHCSDK = TextEditingController();
  late final _textEditingControllerHamLuong = TextEditingController();
  late final _textEditingControllerDongGoi = TextEditingController();
  late final _textEditingControllerHangSX = TextEditingController();
  late final _textEditingControllerNuocSX = TextEditingController();
  bool isUsed = false;
  String hoatchat = '--Lựa chọn--';
  String duongdung = '--Lựa chọn--';
  String dvcapphat = '--Lựa chọn--';
  final DVTViewModel dvtViewModel = new DVTViewModel();

  bool validator = false;

  @override
  Widget build(BuildContext context) {
    void addDataDVT() async {
      String ma = _textEditingControllerMa.text;
      String ten = _textEditingControllerTen.text;
      String sdk = _textEditingControllerSDK.text;
      String sqd = _textEditingControllerSQD.text;
      String hcsdk = _textEditingControllerHCSDK.text;
      String hamuong = _textEditingControllerHamLuong.text;
      String donggoi = _textEditingControllerDongGoi.text;
      String hangsx = _textEditingControllerHangSX.text;
      String nuocsx = _textEditingControllerNuocSX.text;
      if (ma == '' ||
          ten == '' ||
          donggoi == '' ||
          hangsx == '' ||
          nuocsx == '') {
        setState(() {
          validator = true;
        });
      } else {
        DuocVatTu dvt = DuocVatTu(
          ma: ma,
          ten: ten,
          sdk: sdk,
          sqd: sqd,
          hcsdk: hcsdk,
          hamluong: hamuong,
          hoatchat: hoatchat,
          duongdung: duongdung,
          dvcapphat: dvcapphat,
          donggoi: donggoi,
          hangsx: hangsx,
          nuocsx: nuocsx,
          sudung: isUsed,
        );
        dvtViewModel.addDuocVatTu(dvt);
        try{
          dvtViewModel.addDVT.listen((event) {
            print('vao listen api response');
            Navigator.of(context).pop(dvt);
          });
        }catch(e){
          print('================\nloi day');
        }

      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            check: false,
            text: AppLocalizations.of(context)!.translate("medical_add"),
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
                addDataDVT();
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
                        title: AppLocalizations.of(context)!
                            .translate("medical_id"),
                        checkRangBuoc: true,
                        isError:
                            validator && _textEditingControllerMa.text.isEmpty,
                        onChanged: (value) {
                          setState(() {});
                        },
                        textController: _textEditingControllerMa),
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
                        textController: _textEditingControllerTen),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                        title: AppLocalizations.of(context)!
                            .translate("registration_number"),
                        textController: _textEditingControllerSDK),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                        title: AppLocalizations.of(context)!
                            .translate("decisions_number"),
                        textController: _textEditingControllerSQD),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                        title: AppLocalizations.of(context)!
                            .translate("active_ingredient_registration_number"),
                        textController: _textEditingControllerHCSDK),
                    SizedBox(
                      height: 16,
                    ),
                    RowTextField(
                        title:
                            AppLocalizations.of(context)!.translate("content"),
                        textController: _textEditingControllerHamLuong),
                    SizedBox(
                      height: 8,
                    ),
                    CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("medical_ingredient"),
                        value: hoatchat,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                        value1: '32',
                                    titleAppbar: 'hoạt chất',
                                      ))).then((value) {
                            setState(() {
                              hoatchat = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                    CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("oral_route"),
                        value: duongdung,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                        value1: '33',
                                    titleAppbar: 'đường dùng',
                                      ))).then((value) {
                            setState(() {
                              duongdung = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                    CustomDropDown(
                        title: AppLocalizations.of(context)!
                            .translate("allocation_units"),
                        value: dvcapphat,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpinner(
                                        value1: '34',
                                    titleAppbar: 'đơn vị cấp phát',
                                      ))).then((value) {
                            setState(() {
                              dvcapphat = value;
                            });
                          });
                        },
                        icon: Icons.arrow_drop_down_outlined),
                    SizedBox(
                      height: 8,
                    ),
                    RowTextField(
                        title:
                            AppLocalizations.of(context)!.translate("packed"),
                        checkRangBuoc: true,
                        onChanged: (value) {
                          setState(() {});
                        },
                        isError: validator &&
                            _textEditingControllerDongGoi.text.isEmpty,
                        textController: _textEditingControllerDongGoi),
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
                        textController: _textEditingControllerHangSX),
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
                        textController: _textEditingControllerNuocSX),
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
