import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/dropdown/CustomDropDown.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/presentation/DetailSpinner.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyNhanVien/presention/StaffViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../components/inputfieldform/RowTextField.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../../quanLyDichVuKham/data/model/DichVuKham.dart';
import '../../quanLyDichVuKham/presentation/SelectRoom.dart';
import '../data/model/NhanVien.dart';

// ignore: must_be_immutable
class AddEditStaff extends StatefulWidget {
  final bool check;
  NhanVien nhanVien;

  AddEditStaff({
    Key? key,
    required this.check,
    required this.nhanVien,
  }) : super(key: key);

  @override
  State<AddEditStaff> createState() => _AddEditStaffState();
}

class _AddEditStaffState extends State<AddEditStaff> {
  StaffViewModel staffViewModel = new StaffViewModel();

  final Map<String, String> result = {};
  final FocusNode _focusMaNV = FocusNode();
  final FocusNode _focusTenNV = FocusNode();
  final FocusNode _focusMaBS = FocusNode();
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusChucDanh = FocusNode();
  final FocusNode _focusTrinhDo = FocusNode();
  final FocusNode _focusTenPhong = FocusNode();
  final FocusNode _focusHocHam = FocusNode();
  final FocusNode _focusHocVi = FocusNode();
  final FocusNode _focusSDT = FocusNode();
  final FocusNode _focusDiaChi = FocusNode();
  final FocusNode _focusBHYT = FocusNode();
  final FocusNode _focusBHXH = FocusNode();

  final TextEditingController textMaNV = TextEditingController();
  final TextEditingController textTenNV = TextEditingController();
  final TextEditingController textMaBS = TextEditingController();
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textChucDanh = TextEditingController();
  final TextEditingController textTrinhDo = TextEditingController();
  final TextEditingController textTenPhong = TextEditingController();
  final TextEditingController textHocHam = TextEditingController();
  final TextEditingController textHocVi = TextEditingController();
  final TextEditingController textSDT = TextEditingController();
  final TextEditingController textDiaChi = TextEditingController();
  final TextEditingController textBHYT = TextEditingController();
  final TextEditingController textBHXH = TextEditingController();

  //lay ket qua drowdown
  String textLoaiNV = '';
  String textKhoa = '';
  String textPhong = '';
  String textGioiTinh = '';
  String textNgaySinh = '';
  Map<String, String> data = {};

  bool validate = false;

  @override
  void initState() {
    super.initState();
    if (widget.check == false) {
      textMaNV.text = widget.nhanVien.maNv;
      textTenNV.text = widget.nhanVien.tenNv;
      textMaBS.text = widget.nhanVien.maBs;
      textEmail.text = widget.nhanVien.email;
      textChucDanh.text = widget.nhanVien.chucDanh;
      textTrinhDo.text = widget.nhanVien.trinhDo;
      textTenPhong.text = widget.nhanVien.tenPhong;
      textHocHam.text = widget.nhanVien.hocHam;
      textHocVi.text = widget.nhanVien.hocVi;
      textSDT.text = widget.nhanVien.sdt;
      textDiaChi.text = widget.nhanVien.diaChi;
      textBHYT.text = widget.nhanVien.soBhyt;
      textBHXH.text = widget.nhanVien.soBhxh;
      textLoaiNV = widget.nhanVien.loaiNv;
      textKhoa = widget.nhanVien.khoa;
      textPhong = widget.nhanVien.phong;
      textGioiTinh = widget.nhanVien.gioiTinh;
      textNgaySinh = widget.nhanVien.ngaySinh;
    }
    _focusMaNV.addListener(_onFocusChange);
    _focusTenNV.addListener(_onFocusChange);
    _focusMaBS.addListener(_onFocusChange);
    _focusEmail.addListener(_onFocusChange);
    _focusChucDanh.addListener(_onFocusChange);
    _focusTrinhDo.addListener(_onFocusChange);
    _focusTenPhong.addListener(_onFocusChange);
    _focusHocHam.addListener(_onFocusChange);
    _focusHocVi.addListener(_onFocusChange);
    _focusSDT.addListener(_onFocusChange);
    _focusDiaChi.addListener(_onFocusChange);
    _focusBHYT.addListener(_onFocusChange);
    _focusBHXH.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusMaNV.dispose();
    _focusTenNV.dispose();
    _focusMaBS.dispose();
    _focusEmail.dispose();
    _focusChucDanh.dispose();
    _focusTrinhDo.dispose();
    _focusTenPhong.dispose();
    _focusHocHam.dispose();
    _focusHocVi.dispose();
    _focusSDT.dispose();
    _focusDiaChi.dispose();
    _focusBHYT.dispose();
    _focusBHXH.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      widget.nhanVien.maNv = textMaNV.text;
      widget.nhanVien.tenNv = textTenNV.text;
      widget.nhanVien.maBs = textMaBS.text;
      widget.nhanVien.email = textEmail.text;
      widget.nhanVien.chucDanh = textChucDanh.text;
      widget.nhanVien.trinhDo = textTrinhDo.text;
      widget.nhanVien.tenPhong = textTenPhong.text;
      widget.nhanVien.hocHam = textHocHam.text;
      widget.nhanVien.hocVi = textHocVi.text;
      widget.nhanVien.sdt = textSDT.text;
      widget.nhanVien.diaChi = textDiaChi.text;
      widget.nhanVien.soBhyt = textBHYT.text;
      widget.nhanVien.soBhxh = textBHXH.text;
    });
  }

  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void guinhangValue(String loai, String titleAppbar) async {
      var value = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailSpinner(
                    value1: loai,
                    titleAppbar: titleAppbar,
                  )));
      if (value != null) {
        data[loai] = value;
        if (loai == '37') {
          setState(() {
            textKhoa = value;
            widget.nhanVien.khoa = textKhoa;
          });
        }
        if (loai == '51') {
          setState(() {
            textLoaiNV = value;
            widget.nhanVien.loaiNv = textLoaiNV;
          });
        }
        if (loai == '50') {
          setState(() {
            textPhong = value;
            widget.nhanVien.tenPhong = textPhong;
          });
        }
        if (loai == '41') {
          setState(() {
            textGioiTinh = value;
            widget.nhanVien.gioiTinh = textGioiTinh;
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
              text: widget.check == true
                  ? AppLocalizations.of(context)!.translate("add_staff_appbar")
                  : AppLocalizations.of(context)!
                      .translate("edit_staff_appbar"),
              check: false,
              onPress: () {
                Navigator.pop(context, [widget.nhanVien, 'back']);
              },
            ),
          ),
          body: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 16, right: 16, left: 16, bottom: 16),
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxecorationContainer,
                    child: Column(
                      children: [
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("id_staff"),
                          checkRangBuoc: true,
                          focusNode: _focusMaNV,
                          textController: textMaNV,
                          onPress: () {
                            setState(() {
                              textMaNV.clear();
                            });
                          },
                          isError: validate && textMaNV.text.isEmpty,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("name_staff"),
                          checkRangBuoc: true,
                          focusNode: _focusTenNV,
                          textController: textTenNV,
                          onPress: () {
                            setState(() {
                              textTenNV.clear();
                            });
                          },
                          isError: validate && textTenNV.text.isEmpty,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("id_doctor"),
                          focusNode: _focusMaBS,
                          textController: textMaBS,
                          onPress: () {
                            setState(() {
                              textMaBS.clear();
                            });
                          },
                        ),
                        SizedBox(height: 8,),
                        CustomDropDown(
                          title: AppLocalizations.of(context)!
                              .translate("type_staff"),
                          value: textLoaiNV,
                          icon: Icons.arrow_drop_down,
                          onPress: () {
                            guinhangValue('51', 'nhân viên');
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        CustomDropDown(
                            title: AppLocalizations.of(context)!
                                .translate("department"),
                            value: textKhoa,
                            icon: Icons.arrow_drop_down,
                            checkRangBuoc: true,
                            onPress: () {
                              guinhangValue('37', 'khoa');
                            },
                            isError: validate && textKhoa.isEmpty),
                        SizedBox(
                          height: 2,
                        ),
                        CustomDropDown(
                          title:
                              AppLocalizations.of(context)!.translate("room"),
                          value: textPhong,
                          icon: Icons.arrow_drop_down,
                          onPress: () {
                            guinhangValue('50', 'phòng');
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTextField(
                          title:
                              AppLocalizations.of(context)!.translate("email"),
                          focusNode: _focusEmail,
                          textController: textEmail,
                          onPress: () {
                            setState(() {
                              textEmail.clear();
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("title_staff"),
                          focusNode: _focusChucDanh,
                          textController: textChucDanh,
                          onPress: () {
                            setState(() {
                              textChucDanh.clear();
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("level_staff"),
                          focusNode: _focusTrinhDo,
                          textController: textTrinhDo,
                          onPress: () {
                            setState(() {
                              textTrinhDo.clear();
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("name_room"),
                          focusNode: _focusTenPhong,
                          textController: textTenPhong,
                          onPress: () {
                            setState(() {
                              textTenPhong.clear();
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("academic_rank"),
                          focusNode: _focusHocHam,
                          textController: textHocHam,
                          onPress: () {
                            setState(() {
                              textHocHam.clear();
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title:
                              AppLocalizations.of(context)!.translate("degree"),
                          focusNode: _focusHocVi,
                          textController: textHocVi,
                          onPress: () {
                            setState(() {
                              textHocVi.clear();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 16, right: 16, left: 16, bottom: 16),
                    decoration: BoxecorationContainer,
                    child: Column(
                      children: [
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("phone_number"),
                          focusNode: _focusSDT,
                          textController: textSDT,
                          onPress: () {
                            setState(() {
                              textSDT.clear();
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("address_staff"),
                          focusNode: _focusDiaChi,
                          textController: textDiaChi,
                          onPress: () {
                            setState(() {
                              textDiaChi.clear();
                            });
                          },
                        ),
                        SizedBox(height: 8,),
                        CustomDropDown(
                          title:
                              AppLocalizations.of(context)!.translate("born"),
                          value: textNgaySinh,
                          icon: Qlhk.calendar,
                          onPress: () {
                            _show();
                          },
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        CustomDropDown(
                          title:
                              AppLocalizations.of(context)!.translate("gender"),
                          value: textGioiTinh,
                          icon: Icons.arrow_drop_down,
                          onPress: () {
                            guinhangValue('47', 'giới tính');
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("number_BHYT"),
                          focusNode: _focusBHYT,
                          textController: textBHYT,
                          onPress: () {
                            setState(() {
                              textBHYT.clear();
                            });
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        RowTextField(
                          title: AppLocalizations.of(context)!
                              .translate("number_BHXH"),
                          focusNode: _focusBHXH,
                          textController: textBHXH,
                          onPress: () {
                            setState(() {
                              textBHXH.clear();
                            });
                          },
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
                    height: 32,
                    icon: Qlhk.save_outlined,
                    press: () {
                      if (widget.check == true) {
                        checkValidate();
                        if(validate == false){
                          postData();
                        }
                      } else if (widget.check == false) {
                        checkValidate();
                        if(validate == false){
                          putData();
                        }
                      }
                    },
                  )),
                  Container(
                    width: 8,
                  ),
                  Expanded(
                      child: FixedBottomButton(
                    text:
                        AppLocalizations.of(context)!.translate("select_room"),
                    icon: Qlhk.medical,
                    height: 32,
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectRoom(
                                    checkBool: false,
                                    dichVuKham: DichVuKham(
                                        maDichVu: '',
                                        tenDichVu: '',
                                        phiTuVanCu: '',
                                        phiTuVanMoi: '',
                                        phiDatLichCu: '',
                                        phiDatLichMoi: '',
                                        ngayAdGiaMoi: '',
                                        trangThai: false,
                                        id: '',
                                        listPhong: []),
                                    nhanVien: widget.nhanVien,
                                  ))).then((value) {
                        if (value[1] == 'update_nhanVien') {
                          setState(() {
                            widget.nhanVien = value[0];
                          });
                        }
                      });
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
        textNgaySinh = '${formatDate(dateTime, [dd, '/', mm, '/', yyyy])}';

        dateTime.toString();
        print(dateTime);
      });
    }
  }

  void checkValidate() {
    if (textMaNV.text.isNotEmpty &&
        textTenNV.text.isNotEmpty &&
        textKhoa.isNotEmpty) {
      setState(() {
        validate = false;
      });
    } else {
      setState(() {
        validate = true;
      });
    }
  }

  Future<void> postData() async {
    try {
      staffViewModel.addStafff(widget.nhanVien);
      staffViewModel.addstaff.listen((event) {
        Navigator.pop(context, [widget.nhanVien, 'add']);
      });
    } catch (e) {
      print('AddEditStaff => Thêm nhan vien => Lỗi call api: ${e.toString()} ');
    }
  }

  Future<void> putData() async {
    try {
      staffViewModel.updateStafff(widget.nhanVien);
      staffViewModel.updatestaff.listen((event) {
        Navigator.pop(context, [widget.nhanVien, 'edit']);
      });
    } catch (e) {
      print('AddEditStaff => Sửa nhan vien => Lỗi call api: ${e.toString()}');
    }
  }
}
