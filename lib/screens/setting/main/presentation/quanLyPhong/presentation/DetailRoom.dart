import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/container/Decoration.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/CustomTextCheckbox.dart';
import '../../../../../../components/rowflex/RowTextView.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/ListPhongKham.dart';
import 'AddEditRoom.dart';
import 'RoomViewModel.dart';

// ignore: must_be_immutable
class DetailRoom extends StatefulWidget {
  ListPhongKham listPhongKham;
  DetailRoom({Key? key, required this.listPhongKham}) : super(key: key);

  @override
  State<DetailRoom> createState() => _DetailRoomState();
}

class _DetailRoomState extends State<DetailRoom> {
  RoomViewModel roomViewModel = new RoomViewModel();
  bool checkThayDoiEdit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          text: AppLocalizations.of(context)!.translate("detail_room_appbar"),
          check: false,
          onPress: () {
            if (checkThayDoiEdit == false) {
              Navigator.pop(context, [widget.listPhongKham, 'back']);
            } else {
              Navigator.pop(context, [widget.listPhongKham, 'sua']);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 8),
                decoration: BoxecorationContainer,
                child: Column(
                  children: [
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("department"), content: widget.listPhongKham.khoa, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("inpatient_department"),
                      content: widget.listPhongKham.khoaNoiTru, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("id_room"),
                      content: widget.listPhongKham.maPhong, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("health_insurance_room_code"),
                      content: widget.listPhongKham.maPhongBhyt, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("number_room"),
                      content: widget.listPhongKham.soPhong, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("name_room"),
                      content: widget.listPhongKham.tenPhong, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("medical_specialty"),
                      content: widget.listPhongKham.chuyenKhoa, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("type_room"),
                      content: widget.listPhongKham.loaiPhong, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("render_code"),
                      content: widget.listPhongKham.maDauDoc, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("note"),
                      content: widget.listPhongKham.ghiChu, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("qr_Code"),
                      content: widget.listPhongKham.qrCode, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("address_room"),
                      content: widget.listPhongKham.diaChiPhong, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                      lable: AppLocalizations.of(context)!.translate("select_color_room"),
                      content: widget.listPhongKham.maMau, flexItemLeft: 2, flexItemRight: 3,),
                    CustomTextCheckbox(
                      checkIcon: widget.listPhongKham.checkPhongGiaoSu,
                      text: AppLocalizations.of(context)!.translate("professor_room"),
                      onpress: () {},
                    ),
                    CustomTextCheckbox(
                      checkIcon: widget.listPhongKham.checkDangKiHen,
                      text: AppLocalizations.of(context)!.translate("registry_appointment"),
                      onpress: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                decoration: BoxecorationContainer,
                padding: EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 8),
                child: Column(
                  children: [
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("number"), content: widget.listPhongKham.stt, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("room_number"),
                        content: widget.listPhongKham.sttPhong, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("medical_specialty"),
                        content: widget.listPhongKham.chuyenKhoaDrop, flexItemLeft: 2, flexItemRight: 3,),
                    RowTextView(
                        lable: AppLocalizations.of(context)!.translate("public_examination"),
                        content: widget.listPhongKham.congKham, flexItemLeft: 2, flexItemRight: 3,),
                    CustomTextCheckbox(
                      checkIcon: widget.listPhongKham.checkSuDung,
                      text: AppLocalizations.of(context)!.translate("status_use"),
                      onpress: () {},
                    ),
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
              child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("fixed_bottom_edit"), icon: Qlhk.edit, height: 32,press: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEditRoom(
                            checkAddEdit: false,
                            listPhongKham: widget.listPhongKham)))
                    .then((value) {
                  if (value[1] == 'edit') {
                    loadData(value[0]);
                    setState(() {
                      checkThayDoiEdit = true;
                    });
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
                Navigator.pop(context, [widget.listPhongKham.id, 'xoa']);
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
      print('id = ${widget.listPhongKham.id}');
      roomViewModel.deleteRoomm(widget.listPhongKham.id);
    }catch(e){
      print('DetailRoom => Lỗi call api xóa: ${e.toString()} ');
    }
    // String apiUrl = 'https://64d2f44d67b2662bf3db88c8.mockapi.io/';
    // String param = 'listPhongKham/${widget.listPhongKham.id}';
    // await BaseApiNoToken().delete(apiUrl, param);
  }

  void loadData(ListPhongKham value) {
    setState(() {
      widget.listPhongKham = value;
    });
  }
}
