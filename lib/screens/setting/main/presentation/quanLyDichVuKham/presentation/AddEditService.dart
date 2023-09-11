import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/inputfieldform/RowTextField.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDichVuKham/presentation/ServiceViewModel.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/CustomButtonCheckbox.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../quanLyNhanVien/data/model/NhanVien.dart';
import '../data/model/DichVuKham.dart';
import 'SelectRoom.dart';

// ignore: must_be_immutable
class AddServiceCheckup extends StatefulWidget {
  DichVuKham dichvukham;
  final bool check;
  AddServiceCheckup({Key? key, required this.check, required this.dichvukham})
      : super(key: key);

  @override
  State<AddServiceCheckup> createState() => _AddServiceCheckupState();
}

class _AddServiceCheckupState extends State<AddServiceCheckup> {
  ServiceViewModel serviceViewModel = new ServiceViewModel();

  //Map luu ket qua
  final FocusNode _focusMaDV = FocusNode();
  final FocusNode _focusTenDV = FocusNode();
  final FocusNode _focusTuVanCu = FocusNode();
  final FocusNode _focusTuVanMoi = FocusNode();
  final FocusNode _focusDatLichCu = FocusNode();
  final FocusNode _focusDatLichMoi = FocusNode();
  final FocusNode _focusNgay = FocusNode();

  final TextEditingController textTen = TextEditingController();
  final TextEditingController textMa = TextEditingController();
  final TextEditingController textTuVanCu = TextEditingController();
  final TextEditingController textTuVanMoi = TextEditingController();
  final TextEditingController textDatLichCu = TextEditingController();
  final TextEditingController textDatLichMoi = TextEditingController();
  final TextEditingController textDatNgay = TextEditingController();

  bool ktraHieuLuc = false;
  bool ktraHetHieuLuc = false;

  bool validate = false;
  @override
  void initState() {
    super.initState();
    //set gia tri ban dau khi sua
    if (widget.check == false) {
      textTen.text = widget.dichvukham.tenDichVu;
      textMa.text = widget.dichvukham.maDichVu;
      textTuVanCu.text = widget.dichvukham.phiDatLichCu;
      textTuVanMoi.text = widget.dichvukham.phiTuVanMoi;
      textDatLichCu.text = widget.dichvukham.phiDatLichCu;
      textDatLichMoi.text = widget.dichvukham.phiDatLichMoi;
      textDatNgay.text = widget.dichvukham.ngayAdGiaMoi;
      if (widget.dichvukham.trangThai == true) {
        ktraHieuLuc = true;
      } else {
        ktraHetHieuLuc = true;
      }
    }
    _focusTenDV.addListener(_onFocusChange);
    _focusMaDV.addListener(_onFocusChange);
    _focusTuVanCu.addListener(_onFocusChange);
    _focusTuVanMoi.addListener(_onFocusChange);

    _focusDatLichCu.addListener(_onFocusChange);
    _focusDatLichMoi.addListener(_onFocusChange);
    _focusNgay.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusTenDV.dispose();
    _focusMaDV.dispose();
    _focusTuVanCu.dispose();
    _focusTuVanMoi.dispose();

    _focusDatLichCu.dispose();
    _focusDatLichMoi.dispose();
    _focusNgay.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      widget.dichvukham.tenDichVu = textTen.text;
      widget.dichvukham.maDichVu = textMa.text;
      widget.dichvukham.phiTuVanCu = textTuVanCu.text;
      widget.dichvukham.phiTuVanMoi = textTuVanMoi.text;
      widget.dichvukham.phiDatLichCu = textDatLichCu.text;
      widget.dichvukham.phiDatLichMoi = textDatLichMoi.text;
      widget.dichvukham.ngayAdGiaMoi = textDatNgay.text;
    });
  }

  DateTime dateTime = DateTime.now();
  void updateHieuLuc() {
    setState(() {
      ktraHieuLuc = !ktraHieuLuc;
      //chi duoc chon 1
      if (ktraHetHieuLuc == ktraHieuLuc) {
        ktraHetHieuLuc = !ktraHetHieuLuc;
      }
      if (ktraHieuLuc == true) {
        widget.dichvukham.trangThai = true;
      } else {
        widget.dichvukham.trangThai = false;
      }
    });
  }

  void updateHetHieuLuc() {
    setState(() {
      ktraHetHieuLuc = !ktraHetHieuLuc;
      if (ktraHieuLuc == ktraHetHieuLuc) {
        ktraHieuLuc = !ktraHieuLuc;
      }
      if (ktraHetHieuLuc == true) {
        widget.dichvukham.trangThai = false;
      } else {
        widget.dichvukham.trangThai = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              text: widget.check == true
                  ? AppLocalizations.of(context)!.translate("add_service_appbar")
                  : AppLocalizations.of(context)!.translate("edit_service_appbar"),
              check: false,
              onPress: () {
                Navigator.pop(context, [widget.dichvukham, 'back']);
              },
            ),
          ),
          body: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                decoration: BoxecorationContainer,
                padding: EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 16),
                margin: EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 16),
                child: Column(
                  children: [
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("id_service"),
                      checkRangBuoc: true,
                      focusNode: _focusMaDV,
                      textController: textMa,
                      onPress: () {
                        setState(() {
                          textMa.clear();
                        });
                      },
                      isError: validate && textMa.text.isEmpty,
                    ),
                    SizedBox(height: 16,),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("name_service"),
                      checkRangBuoc: true,
                      focusNode: _focusTenDV,
                      textController: textTen,
                      onPress: () {
                        setState(() {
                          textTen.clear();
                        });
                      },
                      isError: validate && textTen.text.isEmpty,
                    ),
                    SizedBox(height: 16,),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("online_consultation_price_old"),
                      checkRangBuoc: true,
                      focusNode: _focusTuVanCu,
                      textController: textTuVanCu,
                      onPress: () {
                        setState(() {
                          textTuVanCu.clear();
                        });
                      },
                      isError: validate && textTuVanCu.text.isEmpty,
                    ),
                    SizedBox(height: 16,),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("online_consultation_price_new"),
                      checkRangBuoc: true,
                      focusNode: _focusTuVanMoi,
                      textController: textTuVanMoi,
                      onPress: () {
                        setState(() {
                          textTuVanMoi.clear();
                        });
                      },
                      isError: validate && textTuVanMoi.text.isEmpty,
                    ),
                    SizedBox(height: 16,),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("clinic_booking_price_old"),
                      checkRangBuoc: true,
                      focusNode: _focusDatLichCu,
                      textController: textDatLichCu,
                      onPress: () {
                        setState(() {
                          textDatLichCu.clear();
                        });
                      },
                      isError: validate && textDatLichCu.text.isEmpty,
                    ),
                    SizedBox(height: 16,),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("clinic_booking_price_new"),
                      checkRangBuoc: true,
                      focusNode: _focusDatLichMoi,
                      textController: textDatLichMoi,
                      onPress: () {
                        setState(() {
                          textDatLichMoi.clear();
                        });
                      },
                      isError: validate && textDatLichMoi.text.isEmpty,
                    ),
                    SizedBox(height: 16,),
                    RowTextField(
                      title: AppLocalizations.of(context)!.translate("date_add_price"),
                      icon: Icon(
                        Icons.calendar_month,
                        size: 14,
                      ),
                      checkRangBuoc: true,
                      focusNode: _focusNgay,
                      textController: textDatNgay,
                      onPress: () {
                        _show();
                      },
                      isError: validate && textDatNgay.text.isEmpty,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child:
                            CustomButtonCheckbox(
                                height: 32,
                                textButton: AppLocalizations.of(context)!.translate("effect"),
                                checkIcon: ktraHieuLuc,
                                onPressed: () {
                                  updateHieuLuc();
                                }),
                          ),
                          Container(
                            width: 16,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomButtonCheckbox(
                                height: 32,
                                textButton: AppLocalizations.of(context)!.translate("expire"),
                                checkIcon: ktraHetHieuLuc,
                                onPressed: () {
                                  updateHetHieuLuc();
                                }),
                          ),
                        ])
                  ],
                ),
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
                    child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("save"), height: 32, icon: Qlhk.save_outlined,press: (){
                      if (widget.check == true) {
                        checkValidate();
                        if(validate == false){
                          postData();
                          print(
                              'AddService -> Dịch vụ khám được thêm mới là: ${widget.dichvukham} ');
                        }
                      } else if(widget.check == false) {
                        checkValidate();
                        if(validate == false){
                          putData();
                          print(
                              'EditService -> Dịch vụ khám được sửa -> Giá trị mới : ${widget.dichvukham} ');
                        }
                      }
                    },)
                  ),
                  Container(
                    width: 8,
                  ),
                  Expanded(
                    child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("select_room"), icon: Qlhk.medical, height: 32,press: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectRoom(
                                dichVuKham: widget.dichvukham,
                                nhanVien: NhanVien(
                                    maNv: '',
                                    tenNv: '',
                                    maBs: '',
                                    loaiNv: '',
                                    khoa: '',
                                    phong: '',
                                    email: '',
                                    chucDanh: '',
                                    trinhDo: '',
                                    tenPhong: '',
                                    hocHam: '',
                                    hocVi: '',
                                    sdt: '',
                                    diaChi: '',
                                    ngaySinh: '',
                                    gioiTinh: '',
                                    soBhyt: '',
                                    soBhxh: '',
                                    id: '',
                                    listPhong: []),
                                checkBool: true)),
                      ).then((value) {
                        if (value[1] == 'update_dichVuKham') {
                          print(
                              'AddEditService -> Dịch vụ khám sau khi thêm phòng: ${widget.dichvukham}');
                          setState(() {
                            widget.dichvukham = value[0];
                          });
                        }
                      });
                    },)
                  ),
                  Container(
                    width: 16,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _show() async {
    final DateTime? result = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2019),
      lastDate: DateTime(2024),
      locale: const Locale('vi'),
    );
    if (result != null) {
      setState(() {
        dateTime = result;
        textDatNgay.text = '${formatDate(dateTime, [dd, '/', mm, '/', yyyy])}';
        dateTime.toString();
        print(dateTime);
      });
    }
  }

  void checkValidate(){
    if(textMa.text.isNotEmpty && textTen.text.isNotEmpty && textTuVanCu.text.isNotEmpty && textTuVanMoi.text.isNotEmpty && textDatLichCu.text.isNotEmpty && textTuVanMoi.text.isNotEmpty && textDatNgay.text.isNotEmpty){
      setState(() {
        validate = false;
      });
    }else{
      setState(() {
        validate = true;
      });
    }
  }

  Future<void> postData() async {
    try{
      serviceViewModel.addServicee(widget.dichvukham);
      serviceViewModel.addservice.listen((event) {
        Navigator.pop(context, [widget.dichvukham, 'add']);
      });
    }catch(e){
      print('AddEditService => Thêm dich vu => Lỗi call api: ${e.toString()} ');
    }
  }

  Future<void> putData() async {
    try{
      serviceViewModel.updateServicee(widget.dichvukham);
      serviceViewModel.updateservice.listen((event) {
        Navigator.pop(context, [widget.dichvukham, 'edit']);
      });
    }catch(e){
      print('AddEditService => Sua dich vu kham => Lỗi call api: ${e.toString()} ');
    }
  }
}
