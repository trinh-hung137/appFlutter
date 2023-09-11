import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/dropdown/CustomDropDown.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/presentation/DetailSpinner.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import '../../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../../components/checkbox/ListCheckBox.dart';
import '../../../../../../../components/container/Decoration.dart';
import '../../../../../../../components/inputfieldform/RowTextField.dart';
import '../../../../../../../qlhk_icons.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/Khoa.dart';
import '../ViewModelKhoa.dart';

class NewKhoa extends StatefulWidget {
  const NewKhoa({key});

  @override
  State<NewKhoa> createState() => _NewKhoaState();
}

class _NewKhoaState extends State<NewKhoa> {
  //Department department = Department();
  final formKey = GlobalKey<FormState>();
  bool checkEmpty = false;
  late Department khoa;
  final ViewModelKhoa viewModelKhoa = new ViewModelKhoa();

  var makhoaController = TextEditingController();
  var makhoaybtController = TextEditingController();
  var tenkhoaController = TextEditingController();
  var dropbox1Controller = TextEditingController(text: DANH_MUC);
  var dropbox2Controller = TextEditingController(text: DANH_MUC);
  var maluutruController = TextEditingController();

  var dropbox12Controller = TextEditingController(text: DANH_MUC);
  var dropbox22Controller = TextEditingController(text: DANH_MUC);
  var dropbox3Controller = TextEditingController(text: DANH_MUC);
  var ghichuController = TextEditingController();

  late bool ck1Controller;
  late bool ck2Controller;
  late bool ck3Controller;
  late bool ck4Controller;

  FocusNode focusMakhoa = FocusNode();
  FocusNode focusMakhoaybt = FocusNode();
  FocusNode focusTenkhoa = FocusNode();
  FocusNode focusMaluutru = FocusNode();
  FocusNode focusGhichu = FocusNode();

  @override
  void initState() {
    super.initState();
    ck1Controller = false;
    ck2Controller = false;
    ck3Controller = false;
    ck4Controller = false;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    double deviceHeight = deviceData.size.height;

    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                text: AppLocalizations.of(context)!.translate("appbar_new_department_title"),
                check: false,
                onPress: () {
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => ListKhoa()),
                  //         (route) => false);
                  Navigator.of(context).pop();
                },
              ),
            ),
            backgroundColor: Color(0xFFF5F5F5),
            body: Form(
              //key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Column(
                        children: [
                          //topNewKhoa(),
                          Container(
                            decoration: BoxecorationContainer,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  RowTextField(
                                    isError: checkEmpty && makhoaController.text.isEmpty,
                                    title: AppLocalizations.of(context)!.translate('id_department'),
                                    checkRangBuoc: true,
                                    textController: makhoaController,
                                    focusNode: focusMakhoa,
                                    onChanged: (value) => setState(() {}),
                                    onPress: () {
                                      setState(() {
                                        makhoaController.clear();
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  RowTextField(
                                    title: AppLocalizations.of(context)!
                                        .translate("id_department_byt"),
                                    textController: makhoaybtController,
                                    focusNode: focusMakhoaybt,
                                    onPress: () {
                                      setState(() {
                                        makhoaybtController.clear();
                                      });
                                    },
                                  ),
                                  SizedBox(height: 16),
                                  RowTextField(
                                    isError: checkEmpty && tenkhoaController.text.isEmpty,
                                    title:
                                        AppLocalizations.of(context)!.translate("name_department"),
                                    checkRangBuoc: true,
                                    onChanged: (value) => setState(() {}),
                                    textController: tenkhoaController,
                                    focusNode: focusTenkhoa,
                                  ),
                                  SizedBox(height: 8),
                                  CustomDropDown(
                                    isError: checkEmpty && dropbox1Controller.text == DANH_MUC,
                                    checkRangBuoc: true,
                                    title:
                                        AppLocalizations.of(context)!.translate("type_department"),
                                    value: dropbox1Controller.text,
                                    icon: Icons.arrow_drop_down,
                                    onPress: () async {
                                      String? selectedValue = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailSpinner(
                                                  titleAppbar: "Khoa", value1: DM_LOAI_KHOA)));
                                      setState(() {
                                        dropbox1Controller.text = selectedValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 2),
                                  CustomDropDown(
                                    title: AppLocalizations.of(context)!
                                        .translate("medical_specialt_department"),
                                    value: dropbox2Controller.text,
                                    icon: Icons.arrow_drop_down,
                                    onPress: () async {
                                      String? selectedValue = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailSpinner(
                                                  titleAppbar: "Chuyên Khoa",
                                                  value1: DM_CHUYEN_KHOA)));
                                      setState(() {
                                        dropbox2Controller.text = selectedValue!;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 8),
                                  RowTextField(
                                    title:
                                        AppLocalizations.of(context)!.translate("residence_code"),
                                    textController: maluutruController,
                                    focusNode: focusMaluutru,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          //bottomNewKhoa(),
                          Container(
                              decoration: BoxecorationContainer,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                                      child: Column(
                                        children: [
                                          ListCheckBox(
                                            checkDetail: true,
                                            checkIcon: ck1Controller,
                                            text: AppLocalizations.of(context)!
                                                .translate("receive_emergency"),
                                            onpress: () {
                                              setState(() {
                                                ck1Controller = !ck1Controller;
                                              });
                                            },
                                          ),
                                          ListCheckBox(
                                            checkDetail: true,
                                            checkIcon: ck2Controller,
                                            text: AppLocalizations.of(context)!
                                                .translate("receive_pttt"),
                                            onpress: () {
                                              setState(() {
                                                ck2Controller = !ck2Controller;
                                              });
                                            },
                                          ),
                                          ListCheckBox(
                                            checkDetail: true,
                                            checkIcon: ck3Controller,
                                            text: AppLocalizations.of(context)!
                                                .translate("choose_bed_when_you_move_in"),
                                            onpress: () {
                                              setState(() {
                                                ck3Controller = !ck3Controller;
                                              });
                                            },
                                          ),
                                          ListCheckBox(
                                            checkDetail: true,
                                            checkIcon: ck4Controller,
                                            text: AppLocalizations.of(context)!.translate(
                                                "calculate_invoices_according_to_accounting_source"),
                                            onpress: () {
                                              setState(() {
                                                ck4Controller = !ck4Controller;
                                              });
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                                        child: Column(
                                          children: [
                                            CustomDropDown(
                                              title: AppLocalizations.of(context)!
                                                  .translate("manager_department"),
                                              value: dropbox12Controller.text,
                                              icon: Icons.arrow_drop_down,
                                              onPress: () async {
                                                String? selectedValue = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => DetailSpinner(
                                                            titleAppbar: "Trưởng khoa",
                                                            value1: DM_TRUONG_KHOA)));
                                                setState(() {
                                                  dropbox12Controller.text = selectedValue!;
                                                });
                                              },
                                            ),
                                            SizedBox(height: 2),
                                            CustomDropDown(
                                              title: AppLocalizations.of(context)!
                                                  .translate("level_bhyt_left_line"),
                                              value: dropbox22Controller.text,
                                              icon: Icons.arrow_drop_down,
                                              onPress: () async {
                                                String? selectedValue = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => DetailSpinner(
                                                            titleAppbar: "Hạng BH",
                                                            value1: DM_HANG_BH_TRAI_TUYEN)));
                                                setState(() {
                                                  dropbox22Controller.text = selectedValue!;
                                                });
                                              },
                                            ),
                                            SizedBox(height: 2),
                                            CustomDropDown(
                                              title: AppLocalizations.of(context)!
                                                  .translate("health_facilities"),
                                              value: dropbox3Controller.text,
                                              icon: Icons.arrow_drop_down,
                                              onPress: () async {
                                                String? selectedValue = await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => DetailSpinner(
                                                            titleAppbar: "CSYT",
                                                            value1: DM_CO_SO_Y_TE)));
                                                setState(() {
                                                  dropbox3Controller.text = selectedValue!;
                                                });
                                              },
                                            ),
                                            SizedBox(height: 8),
                                            RowTextField(
                                              title:
                                                  AppLocalizations.of(context)!.translate("note"),
                                              textController: ghichuController,
                                              focusNode: focusGhichu,
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Container(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 24),
                      child: FixedBottomButton(
                        iconSize: 20,
                        border: true,
                        text: AppLocalizations.of(context)!.translate("save"),
                        icon: Qlhk.save_outlined,
                        height: 32,
                        press: () async {
                          newKhoa();
                        },
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  void newKhoa() async {
    Department khoa = Department(
        makhoaController.text,
        makhoaybtController.text,
        tenkhoaController.text,
        dropbox1Controller.text,
        dropbox2Controller.text,
        maluutruController.text,
        ck1Controller,
        ck2Controller,
        ck3Controller,
        ck4Controller,
        dropbox12Controller.text,
        dropbox22Controller.text,
        dropbox3Controller.text,
        ghichuController.text,
        TT_KHOA_SU_DUNG,
        null);
    try {
      if (makhoaController.text == '' || tenkhoaController.text == '' ||
          dropbox1Controller.text == DANH_MUC) {
        setState(() {
          checkEmpty = true;
        });
      } else {
        //final kq = viewModelKhoa.addKhoa(khoa);
        viewModelKhoa.addKhoa(khoa);
        viewModelKhoa.addkhoa.listen((event) {
          Navigator.of(context).pop(khoa);
        });
        // Navigator.of(context).pop(khoa);
      }
    } catch (e) {
      print('Lỗi khi thêm data');
      print(e);
    }
  }
}
