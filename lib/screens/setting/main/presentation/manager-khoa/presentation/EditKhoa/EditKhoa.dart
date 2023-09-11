import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/checkbox/ListCheckBox.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/presentation/DetailSpinner.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import '../../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../../components/container/Decoration.dart';
import '../../../../../../../components/dropdown/CustomDropDown.dart';
import '../../../../../../../components/inputfieldform/RowTextField.dart';
import '../../../../../../../qlhk_icons.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/Khoa.dart';
import '../ViewModelKhoa.dart';

class EditKhoa extends StatefulWidget {
  final Department editList;
  const EditKhoa({Key? key, required this.editList}) : super(key: key);

  @override
  State<EditKhoa> createState() => _EditKhoaState();
}

class _EditKhoaState extends State<EditKhoa> {
  //final formKey = GlobalKey<FormState>();
  bool checkEmpty = false;
  late Department khoa;
  final ViewModelKhoa viewModelKhoa = new ViewModelKhoa();

  var makhoaController = TextEditingController();
  var makhoaybtController = TextEditingController();
  var tenkhoaController = TextEditingController();
  var maluutruController = TextEditingController();
  var trangthaiController = TextEditingController();
  var dropbox1Controller = TextEditingController();
  var dropbox2Controller = TextEditingController();

  var dropbox12Controller = TextEditingController();
  var dropbox22Controller = TextEditingController();
  var dropbox3Controller = TextEditingController();
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
    focusMakhoa.addListener(_onFocusChange);
    focusMakhoaybt.addListener(_onFocusChange);
    focusTenkhoa.addListener(_onFocusChange);
    focusMaluutru.addListener(_onFocusChange);
    focusGhichu.addListener(_onFocusChange);

    dropbox1Controller.text = widget.editList.type!;
    dropbox2Controller.text = widget.editList.specialty!;
    makhoaController.text = widget.editList.idDep!;
    makhoaybtController.text = widget.editList.idDepYbt!;
    tenkhoaController.text = widget.editList.name!;
    maluutruController.text = widget.editList.idAddress!;
    trangthaiController.text = widget.editList.state!;

    ck1Controller = widget.editList.ck1!;
    ck2Controller = widget.editList.ck2!;
    ck3Controller = widget.editList.ck3!;
    ck4Controller = widget.editList.ck4!;

    dropbox12Controller.text = widget.editList.managerDep!;
    dropbox22Controller.text = widget.editList.levelBh!;
    dropbox3Controller.text = widget.editList.csyt!;
    ghichuController.text = widget.editList.note!;
  }

  void _onFocusChange() {
    setState(() {
      widget.editList.idDep = makhoaController.text;
      widget.editList.idDepYbt = makhoaybtController.text;
      widget.editList.name = tenkhoaController.text;
      widget.editList.idAddress = maluutruController.text;
      widget.editList.note = ghichuController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusMakhoa.dispose();
    focusMakhoaybt.dispose();
    focusTenkhoa.dispose();
    focusMaluutru.dispose();
    focusGhichu.dispose();
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
              text: AppLocalizations.of(context)!.translate("appbar_edit_department_title"),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxecorationContainer,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 8),
                          child: Column(
                            children: [
                              RowTextField(
                                  isError: checkEmpty && makhoaController.text.isEmpty,
                                  title: AppLocalizations.of(context)!.translate('id_department'),
                                  checkRangBuoc: true,
                                  textController: makhoaController,
                                  //onChanged: (p0) => makhoaController.text = p0,
                                  onChanged: (value) => setState(() {}),
                                  focusNode: focusMakhoa,
                                  onPress: () {
                                    setState(() {
                                      makhoaController.clear();
                                    });
                                  }),
                              SizedBox(height: 16),
                              RowTextField(
                                  title:
                                      AppLocalizations.of(context)!.translate("id_department_byt"),
                                  textController: makhoaybtController,
                                  focusNode: focusMakhoaybt,
                                  //onChanged: (p0) => makhoaybtController.text = p0,
                                  onPress: () {
                                    setState(() {
                                      makhoaybtController.clear();
                                    });
                                  }),
                              SizedBox(height: 16),
                              RowTextField(
                                  isError: checkEmpty && makhoaController.text.isEmpty,
                                  title: AppLocalizations.of(context)!.translate("name_department"),
                                  checkRangBuoc: true,
                                  textController: tenkhoaController,
                                  focusNode: focusTenkhoa,
                                  onChanged: (value) => setState(() {}),
                                  //onChanged: (p0) => tenkhoaController.text = p0,
                                  onPress: () {
                                    setState(() {
                                      tenkhoaController.clear();
                                    });
                                  }),
                              SizedBox(height: 8),
                              CustomDropDown(
                                isError: checkEmpty && dropbox1Controller.text == DANH_MUC,
                                checkRangBuoc: true,
                                title: AppLocalizations.of(context)!.translate("type_department"),
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
                                              titleAppbar: "Chuyên Khoa", value1: DM_CHUYEN_KHOA)));
                                  setState(() {
                                    dropbox2Controller.text = selectedValue!;
                                  });
                                },
                              ),
                              SizedBox(height: 8),
                              RowTextField(
                                  title: AppLocalizations.of(context)!.translate("residence_code"),
                                  textController: maluutruController,
                                  focusNode: focusMaluutru,
                                  //onChanged: (p0) => maluutruController.text = p0,
                                  onPress: () {
                                    setState(() {
                                      maluutruController.clear();
                                    });
                                  }),
                              SizedBox(height: 16),
                              RowTextField(
                                title: AppLocalizations.of(context)!.translate("status"),
                                textController: trangthaiController,
                                icon: Icon(
                                  Icons.add,
                                  color: backgroundScreenColor,
                                ),
                                show: false,
                                read: true,
                                backgroudText: backgroundScreenColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // bottomEditKhoa(
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
                                            print(ck1Controller);
                                          });
                                        },
                                      ),
                                      ListCheckBox(
                                        checkDetail: true,
                                        checkIcon: ck2Controller,
                                        text:
                                            AppLocalizations.of(context)!.translate("receive_pttt"),
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
                                            title: AppLocalizations.of(context)!.translate("note"),
                                            textController: ghichuController,
                                            focusNode: focusGhichu,
                                            //onChanged: (p0) => ghichuController.text = p0,
                                            onPress: () {
                                              setState(() {
                                                ghichuController.clear();
                                              });
                                            })
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
                    press: () {
                      updateKhoa();
                    },
                  ),
                ),
              )
            ],
          )),
        ));
  }

  void updateKhoa() async {
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
        widget.editList.id);
    try {
      if (makhoaController.text == '' || tenkhoaController.text == '') {
        setState(() {
          checkEmpty = true;
        });
      } else {
        final kq = viewModelKhoa.updateKhoa(khoa);
        Navigator.of(context).pop(khoa);
      }
    } catch (e) {
      print('Lỗi khi sửa data');
      print(e);
    }
  }
}
