import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';

import '../../../../../../../components/container/CustomContain.dart';
import '../../../../../../../components/container/DecorationSearch.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/NhanVien.dart';
import '../AddEditStaff.dart';


class ContainerManageStaff extends StatefulWidget {
  final void Function(Map<String, String> ketqua) dataSend;
  final void Function(NhanVien nhanVien) senDataAdd;
  const ContainerManageStaff({
    Key? key,
    required this.dataSend, required this.senDataAdd,
  }) : super(key: key);

  @override
  State<ContainerManageStaff> createState() => _ContainerManageStaffState();
}

class _ContainerManageStaffState extends State<ContainerManageStaff> {
  final FocusNode _focusMaBS = FocusNode();
  final FocusNode _focusMaNV = FocusNode();
  final FocusNode _focusTenNV = FocusNode();
  final FocusNode _focusKhoa = FocusNode();
  final FocusNode _focusLoaiNV = FocusNode();

  final TextEditingController textMaBS = TextEditingController();
  final TextEditingController textMaNV = TextEditingController();
  final TextEditingController textTenNV = TextEditingController();
  final TextEditingController textKhoa = TextEditingController();
  final TextEditingController textLoaiNV = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusMaBS.addListener(_onFocusChange);
    _focusMaNV.addListener(_onFocusChange);
    _focusTenNV.addListener(_onFocusChange);
    _focusKhoa.addListener(_onFocusChange);
    _focusLoaiNV.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusMaBS.dispose();
    _focusMaNV.dispose();
    _focusTenNV.dispose();
    _focusKhoa.dispose();
    _focusLoaiNV.dispose();

    super.dispose();
  }

  final Map<String, String> ketqua = {};
  void _onFocusChange() {
    setState(() {
      ketqua['textMaNV'] = textMaNV.text;
      ketqua['textMaBS'] = textMaBS.text;
      ketqua['textTenNV'] = textTenNV.text;
      ketqua['textKhoa'] = textKhoa.text;
      ketqua['textLoaiNV'] = textLoaiNV.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxecorationContainerSearch,
          margin: EdgeInsets.only(top: 8,left: 16,right: 16),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomContain(
                      containerText: AppLocalizations.of(context)!.translate("id_staff"),
                      focusNode: _focusMaNV,
                      textEditingController: textMaNV,
                      onPress: () {
                        setState(() {
                          textMaNV.clear();
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomContain(
                      containerText: AppLocalizations.of(context)!.translate("id_doctor"),
                      focusNode: _focusMaBS,
                      textEditingController: textMaBS,
                      onPress: () {
                        setState(() {
                          textMaBS.clear();
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CustomContain(
                      containerText: AppLocalizations.of(context)!.translate("name_staff"),
                      focusNode: _focusTenNV,
                      textEditingController: textTenNV,
                      onPress: () {
                        setState(() {
                          textTenNV.clear();
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomContain(
                      containerText: AppLocalizations.of(context)!.translate("department"),
                      focusNode: _focusKhoa,
                      textEditingController: textKhoa,
                      onPress: () {
                        setState(() {
                          textKhoa.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CustomContain(
                      containerText: AppLocalizations.of(context)!.translate("type_staff"),
                      focusNode: _focusLoaiNV,
                      textEditingController: textLoaiNV,
                      onPress: () {
                        setState(() {
                          textLoaiNV.clear();
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 15,
                          ),
                          SizedBox(height: 5),

                        ]),
                  )
                ],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 2,
                      child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("searching"), icon: Qlhk.search, height: 32,press: (){
                        print(ketqua);
                      } ,)
                  ),
                  Container(
                    width: 16,
                  ),
                  Expanded(
                    flex: 2,
                      child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("adding"), icon: Qlhk.add, height: 32,press: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddEditStaff(
                                    check: true,
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
                                        listPhong: [])))).then((value) {
                          setState(() {
                            if (value[1] == 'add') {
                             widget.senDataAdd(value[0]);
                            }
                          });
                        });
                      },)),

                ],
              ),
            ],
          ),
        ));
  }
}
