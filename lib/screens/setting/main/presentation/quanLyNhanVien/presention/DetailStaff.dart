import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyNhanVien/presention/StaffViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/container/Decoration.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/NhanVien.dart';
import 'AddEditStaff.dart';

// ignore: must_be_immutable
class DetailStaff extends StatefulWidget {
  NhanVien nhanVien;
  DetailStaff({Key? key, required this.nhanVien}) : super(key: key);

  @override
  State<DetailStaff> createState() => _DetailStaffState();
}

class _DetailStaffState extends State<DetailStaff> {
  StaffViewModel staffViewModel = new StaffViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          text: 'Chi tiết thông tin nhân viên',
          check: false,
          onPress: () {
            Navigator.pop(context, [widget.nhanVien, 'back']);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 8),
                decoration: BoxecorationContainer,
                child: Column(
                  children: [
                    RowTextView(lable: AppLocalizations.of(context)!.translate("id_staff"), content: widget.nhanVien.maNv, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(lable: AppLocalizations.of(context)!.translate("name_staff"), content: widget.nhanVien.tenNv, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("id_doctor"), content: widget.nhanVien.maBs, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("type_staff"),
                        content: widget.nhanVien.loaiNv, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("department"), content: widget.nhanVien.khoa, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("room"), content: widget.nhanVien.phong, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("email"), content: widget.nhanVien.email, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("title_staff"),
                        content: widget.nhanVien.chucDanh, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("level_staff"),
                        content: widget.nhanVien.trinhDo, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("academic_rank"), content: widget.nhanVien.hocHam, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("degree"), content: widget.nhanVien.hocVi, flexItemLeft: 2, flexItemRight: 3),
                  ],
                ),
              ),

              Container(
                decoration: BoxecorationContainer,
                padding: EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 8),
                child: Column(
                  children: [
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("phone_number"), content: widget.nhanVien.sdt, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("address_staff"), content: widget.nhanVien.diaChi, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("born"),
                        content: widget.nhanVien.ngaySinh, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("gender"),
                        content: widget.nhanVien.gioiTinh, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("number_BHYT"), content: widget.nhanVien.soBhyt, flexItemLeft: 2, flexItemRight: 3),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("number_BHXH"), content: widget.nhanVien.soBhxh, flexItemLeft: 2, flexItemRight: 3),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 64,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 16,
            ),
            Expanded(
              flex: 2,
              child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("fixed_bottom_edit"), icon: Qlhk.edit, height: 32, press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEditStaff(
                            check: false,
                            nhanVien: widget.nhanVien))).then((value) {
                  if (value[1] == 'edit') {
                    loadData(value[0]);
                  }
                });
              },)
            ),
            Container(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("fixed_bottom_remove"), icon: Qlhk.cancel, height: 32,press: (){
                deleteData();
                Navigator.pop(context, [widget.nhanVien.id, 'xoa']);
              },)
            ),
            Container(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteData() async {
    try{
      staffViewModel.deleteStafff(widget.nhanVien.id);
    }catch(e){
      print('DetailStaff => Lỗi call api xóa: ${e.toString()} ');
    }
    // String apiUrl = 'https://64d4af54b592423e46947f71.mockapi.io/';
    // String param = 'nhanVien/${widget.nhanVien.id}';
    // await BaseApiNoToken().delete(apiUrl, param);
  }

  void loadData(NhanVien value) {
    setState(() {
      widget.nhanVien = value;
    });
  }
}
