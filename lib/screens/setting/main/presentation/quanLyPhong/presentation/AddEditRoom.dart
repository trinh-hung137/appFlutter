import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/container/Decoration.dart';
import 'package:vncare_qlhk/components/dropdown/CustomDropDown.dart';
import 'package:vncare_qlhk/components/inputfieldform/RowTextField.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/presentation/DetailSpinner.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/CustomTextCheckbox.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/ListPhongKham.dart';
import 'RoomViewModel.dart';

class AddEditRoom extends StatefulWidget {
  final ListPhongKham listPhongKham;
  final bool checkAddEdit;

  const AddEditRoom(
      {Key? key, required this.checkAddEdit, required this.listPhongKham})
      : super(key: key);

  @override
  State<AddEditRoom> createState() => _AddEditRoomState();
}

class _AddEditRoomState extends State<AddEditRoom> {
  RoomViewModel roomViewModel = new RoomViewModel();
  final FocusNode _focusMaPhong = FocusNode();
  final FocusNode _focusMaPhongBHYT = FocusNode();
  final FocusNode _focusSoPhong = FocusNode();
  final FocusNode _focusTenPhong = FocusNode();
  final FocusNode _focusMaDauDoc = FocusNode();
  final FocusNode _focusGhiChu = FocusNode();
  final FocusNode _focusQRCode = FocusNode();
  final FocusNode _focusDiaChiPhong = FocusNode();
  final FocusNode _focusMaMau = FocusNode();
  final FocusNode _focusSTT = FocusNode();
  final FocusNode _focusSTTPhong = FocusNode();
  final FocusNode _focusChuyenKhoa = FocusNode();

  final TextEditingController textMaPhong = TextEditingController();
  final TextEditingController textMaPhongBHYT = TextEditingController();
  final TextEditingController textSoPhong = TextEditingController();
  final TextEditingController textTenPhong = TextEditingController();
  final TextEditingController textMaDauDoc = TextEditingController();
  final TextEditingController textGhiChu = TextEditingController();
  final TextEditingController textQRCode = TextEditingController();
  final TextEditingController textDiaChiPhong = TextEditingController();
  final TextEditingController textMaMau = TextEditingController();
  final TextEditingController textSTT = TextEditingController();
  final TextEditingController textSTTPhong = TextEditingController();
  final TextEditingController textChuyenKhoa = TextEditingController();
  String textKhoa = '';
  String textKhoaNoiTru = '';
  String textChuyenKhoaDrop = '';
  String textLoaiPhong = '';
  String textCongKham = '';
  Map<String,String> data = {};

  bool validate = false;


  @override
  void initState() {
    super.initState();
    if (widget.checkAddEdit == false) {
      textMaPhong.text = widget.listPhongKham.maPhong;
      textMaPhongBHYT.text = widget.listPhongKham.maPhongBhyt;
      textSoPhong.text = widget.listPhongKham.soPhong;
      textTenPhong.text = widget.listPhongKham.tenPhong;
      textMaDauDoc.text = widget.listPhongKham.maDauDoc;
      textGhiChu.text = widget.listPhongKham.ghiChu;
      textQRCode.text = widget.listPhongKham.qrCode;
      textDiaChiPhong.text = widget.listPhongKham.diaChiPhong;
      textMaMau.text = widget.listPhongKham.maMau;
      textSTT.text = widget.listPhongKham.stt;
      textSTTPhong.text = widget.listPhongKham.sttPhong;
      textChuyenKhoa.text = widget.listPhongKham.chuyenKhoa;
      textKhoa = widget.listPhongKham.khoa;
      textKhoaNoiTru = widget.listPhongKham.khoaNoiTru;
      textChuyenKhoaDrop = widget.listPhongKham.chuyenKhoaDrop;
      textLoaiPhong = widget.listPhongKham.loaiPhong;
      textCongKham = widget.listPhongKham.congKham;
    }
    _focusMaPhong.addListener(_onFocusChange);
    _focusMaPhongBHYT.addListener(_onFocusChange);
    _focusSoPhong.addListener(_onFocusChange);
    _focusTenPhong.addListener(_onFocusChange);
    _focusMaDauDoc.addListener(_onFocusChange);
    _focusGhiChu.addListener(_onFocusChange);
    _focusQRCode.addListener(_onFocusChange);
    _focusDiaChiPhong.addListener(_onFocusChange);
    _focusMaMau.addListener(_onFocusChange);
    _focusSTT.addListener(_onFocusChange);
    _focusSTTPhong.addListener(_onFocusChange);
    _focusChuyenKhoa.addListener(_onFocusChange);
    // textMaPhong.text = 'Phong 1';
  }

  @override
  void dispose() {
    _focusMaPhong.dispose();
    _focusMaPhongBHYT.dispose();
    _focusSoPhong.dispose();
    _focusTenPhong.dispose();
    _focusMaDauDoc.dispose();
    _focusGhiChu.dispose();
    _focusQRCode.dispose();
    _focusDiaChiPhong.dispose();
    _focusMaMau.dispose();
    _focusSTT.dispose();
    _focusSTTPhong.dispose();
    _focusChuyenKhoa.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      widget.listPhongKham.maPhong = textMaPhong.text;
      widget.listPhongKham.maPhongBhyt = textMaPhongBHYT.text;
      widget.listPhongKham.soPhong = textSoPhong.text;
      widget.listPhongKham.tenPhong = textTenPhong.text;
      widget.listPhongKham.maDauDoc = textMaDauDoc.text;
      widget.listPhongKham.ghiChu = textGhiChu.text;
      widget.listPhongKham.qrCode = textQRCode.text;
      widget.listPhongKham.diaChiPhong = textDiaChiPhong.text;
      widget.listPhongKham.maMau = textMaMau.text;
      widget.listPhongKham.stt = textSTT.text;
      widget.listPhongKham.sttPhong = textSTTPhong.text;
      widget.listPhongKham.chuyenKhoa = textChuyenKhoa.text;
    });
  }

  void updateCheckPhongGiaoSu() {
    setState(() {
      widget.listPhongKham.checkPhongGiaoSu =
          !widget.listPhongKham.checkPhongGiaoSu;
    });
  }

  void updateCheckDangKiHen() {
    setState(() {
      widget.listPhongKham.checkDangKiHen =
          !widget.listPhongKham.checkDangKiHen;
    });
  }

  void updateCheckSuDung() {
    setState(() {
      widget.listPhongKham.checkSuDung = !widget.listPhongKham.checkSuDung;
    });
  }

  @override
  Widget build(BuildContext context) {
    void guinhanValue(String loai, String titleAppbar) async {
      var value = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailSpinner(
                    value1: loai, titleAppbar: titleAppbar
                  )));
        if (value != null) {
            data[loai] = value;
            if(loai =="37"){
              setState(() {
                textKhoa = value;
                widget.listPhongKham.khoa = textKhoa;
              });
            }else if(loai == '48'){
              setState(() {
                textKhoaNoiTru = value;
                widget.listPhongKham.khoaNoiTru = textKhoaNoiTru;
              });
            }else if(loai =='38'){
              setState(() {
                textChuyenKhoaDrop = value;
                widget.listPhongKham.chuyenKhoaDrop = textChuyenKhoaDrop;
              });
            }else if(loai == '50'){
              setState(() {
                textLoaiPhong = value;
                widget.listPhongKham.loaiPhong = textLoaiPhong;
              });
            }else if(loai == '49'){
              setState(() {
                textCongKham = value;
                widget.listPhongKham.congKham = textCongKham;
              });

            }
        }
    }
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: widget.checkAddEdit == true
                  ? AppLocalizations.of(context)!.translate("add_room_appbar")
                  : AppLocalizations.of(context)!.translate("edit_room_appbar"),
              check: false,
              onPress: () {
                Navigator.pop(context, [widget.listPhongKham, 'back']);
              },
            ),
          ),
          body: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 8,right: 16,left: 16,bottom: 8),
                    decoration: BoxecorationContainer,
                    child: Column(
                      children: [
                        CustomDropDown(
                          onPress: () {
                            guinhanValue('37','khoa');
                          },
                          value: textKhoa,
                          title: AppLocalizations.of(context)!.translate("department"),
                          checkRangBuoc: true, icon: Icons.arrow_drop_down,
                          isError: validate && textKhoa.isEmpty
                        ),
                        SizedBox(height: 2,),
                        CustomDropDown(
                          onPress: () {
                            guinhanValue('48','khoa nội trú');
                          },
                          value: textKhoaNoiTru,
                          title: AppLocalizations.of(context)!.translate("inpatient_department"), icon: Icons.arrow_drop_down,
                        ),
                        SizedBox(height: 10,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("id_room"),
                          checkRangBuoc: true,
                          focusNode: _focusMaPhong,
                          textController: textMaPhong,
                          onPress: () {
                            setState(() {
                              textMaPhong.clear();
                            });
                          },
                          isError: validate && textMaPhong.text.isEmpty,
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("health_insurance_room_code"),
                          focusNode: _focusMaPhongBHYT,
                          textController: textMaPhongBHYT,
                          onPress: () {
                            setState(() {
                              textMaPhongBHYT.clear();
                            });
                          },
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("number_room"),
                          checkRangBuoc: true,
                          focusNode: _focusSoPhong,
                          textController: textSoPhong,
                          onPress: () {
                            setState(() {
                              textSoPhong.clear();
                            });
                          },
                          isError: validate && textSoPhong.text.isEmpty,
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("name_room"),
                          checkRangBuoc: true,
                          focusNode: _focusTenPhong,
                          textController: textTenPhong,
                          onPress: () {
                            setState(() {
                              textTenPhong.clear();
                            });
                          },
                          isError: validate && textTenPhong.text.isEmpty,
                        ),
                        SizedBox(height: 8,),
                        CustomDropDown(
                          onPress: () {
                            guinhanValue('38','chuyên khoa');
                          },
                          value: textChuyenKhoaDrop,
                          title: AppLocalizations.of(context)!.translate("medical_specialty"),
                          icon: Icons.arrow_drop_down,
                        ),
                        SizedBox(height: 2,),
                        CustomDropDown(
                          onPress: () {
                            guinhanValue('50','phòng');
                          },
                          value: textLoaiPhong,
                          title: AppLocalizations.of(context)!.translate("type_room"),
                          checkRangBuoc: true,
                          icon: Icons.arrow_drop_down,
                          isError: validate && textLoaiPhong.isEmpty,
                        ),
                        SizedBox(height: 10,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("render_code"),
                          focusNode: _focusMaDauDoc,
                          textController: textMaDauDoc,
                          onPress: () {
                            setState(() {
                              textMaDauDoc.clear();
                            });
                          },
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("note"),
                          textController: textGhiChu,
                          focusNode: _focusGhiChu,
                          onPress: () {
                            setState(() {
                              textGhiChu.clear();
                            });
                          },
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("qr_Code"),
                          textController: textQRCode,
                          focusNode: _focusQRCode,
                          onPress: () {
                            setState(() {
                              textQRCode.clear();
                            });
                          },
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("address_room"),
                          focusNode: _focusDiaChiPhong,
                          textController: textDiaChiPhong,
                          onPress: () {
                            setState(() {
                              textDiaChiPhong.clear();
                            });
                          },
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("select_color_room"),
                          focusNode: _focusMaMau,
                          textController: textMaMau,
                          onPress: () {
                            setState(() {
                              textMaMau.clear();
                            });
                          },
                        ),
                        SizedBox(height: 8,),
                        CustomTextCheckbox(
                          checkIcon:
                              widget.listPhongKham.checkPhongGiaoSu,
                          text: AppLocalizations.of(context)!.translate("professor_room"),
                          onpress: () {
                            updateCheckPhongGiaoSu();
                          },
                          checkDetail: true,
                          left: 4,
                          right: 6,
                        ),
                        SizedBox(height: 4,),
                        CustomTextCheckbox(
                          checkIcon: widget.listPhongKham.checkDangKiHen,
                          text: AppLocalizations.of(context)!.translate("registry_appointment"),
                          onpress: () {
                            updateCheckDangKiHen();
                          },
                          checkDetail: true,
                          left: 4,
                          right: 6,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.translate("information_display_screen"),
                        style: TextStyle(
                            color: Color(0xFF4F82C2),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 8),
                    decoration: BoxecorationContainer,
                    child: Column(
                      children: [
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("number"),
                          focusNode: _focusSTT,
                          textController: textSTT,
                          onPress: () {
                            setState(() {
                              textSTT.clear();
                            });
                          },
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("room_number"),
                          focusNode: _focusSTTPhong,
                          textController: textSTTPhong,
                          onPress: () {
                            setState(() {
                              textSTTPhong.clear();
                            });
                          },
                        ),
                        SizedBox(height: 16,),
                        RowTextField(
                          title: AppLocalizations.of(context)!.translate("medical_specialty"),
                          focusNode: _focusChuyenKhoa,
                          textController: textChuyenKhoa,
                          onPress: () {
                            setState(() {
                              textChuyenKhoa.clear();
                            });
                          },
                        ),
                        SizedBox(height: 8,),
                        CustomDropDown(
                          onPress: () {
                            guinhanValue('49','công khám');
                          },
                          value: textCongKham,
                          title: AppLocalizations.of(context)!.translate("public_examination"),
                          icon: Icons.arrow_drop_down,
                        ),
                        SizedBox(height: 4,),
                        CustomTextCheckbox(
                          checkIcon: widget.listPhongKham.checkSuDung,
                          text: AppLocalizations.of(context)!.translate("status_use"),
                          onpress: () {
                            updateCheckSuDung();
                          },
                          checkDetail: true,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            bottomNavigationBar: Container(
              width: MediaQuery.of(context).size.width,
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 16,
                  ),
                  Expanded(
                      child: FixedBottomButton(
                    text: AppLocalizations.of(context)!.translate("save"),
                    icon: Qlhk.save_outlined,
                    height: 32,
                    press: () {
                      if (widget.checkAddEdit == true) {
                          checkValidate();
                          if(validate==false){
                            postData();
                            // Navigator.pop(context, [widget.listPhongKham, 'add']);
                          }
                      } else if(widget.checkAddEdit == false){
                          checkValidate();
                          if(validate==false){
                            putData();
                            // Navigator.pop(context, [widget.listPhongKham, 'edit']);
                          }
                      }
                    },
                  )),
                  Container(
                    width: 16,
                  ),
                ],
              ),
            ),
          )),
    );
  }
  void checkValidate(){
    if(textKhoa.isNotEmpty && textMaPhong.text.isNotEmpty && textSoPhong.text.isNotEmpty && textTenPhong.text.isNotEmpty && textLoaiPhong.isNotEmpty){
      setState(() {
        validate = false;
      });
    }else{
      setState(() {
        validate = true;
      });
    }
  }

  Future<void> postData() async{
    try{
      roomViewModel.addRoomm(widget.listPhongKham);
      roomViewModel.addroom.listen((event) {
          Navigator.pop(context, [widget.listPhongKham, 'add']);
      });
    }catch(e){
      print('AddEditRoom => Thêm phòng => Lỗi call api: ${e.toString()} ');
    }
  }

  Future<void> putData() async {
    try{
      roomViewModel.updateRoomm(widget.listPhongKham);
      roomViewModel.updateroom.listen((event) {
        Navigator.pop(context, [widget.listPhongKham, 'edit']);
      });
    }catch(e){
      print('AddEditRoom => Sửa phòng => Lỗi call api: ${e.toString()}');
    }
  }
}
