import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/container/DecorationSearch.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';

import '../../../../../../../components/container/CustomContain.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/ListPhongKham.dart';
import '../AddEditRoom.dart';

class ContainerManageRoom extends StatefulWidget {
  final void Function(Map<String, String> ketqua) dataSend;
  final void Function(ListPhongKham listPhongKham) senDataAdd;

  const ContainerManageRoom(
      {Key? key, required this.dataSend, required this.senDataAdd})
      : super(key: key);

  @override
  State<ContainerManageRoom> createState() => _ContainerManageRoomState();
}

class _ContainerManageRoomState extends State<ContainerManageRoom> {
  final FocusNode _focusMaPhong = FocusNode();
  final FocusNode _focusTenPhong = FocusNode();
  final FocusNode _focusKhoa = FocusNode();
  final FocusNode _focusTrangThai = FocusNode();

  final TextEditingController textTen = TextEditingController();
  final TextEditingController textMa = TextEditingController();
  final TextEditingController textTrangThai = TextEditingController();
  final TextEditingController textKhoa = TextEditingController();

  final Map<String, String> ketqua = {};
  @override
  void initState() {
    super.initState();
    _focusTenPhong.addListener(_onFocusChange);
    _focusMaPhong.addListener(_onFocusChange);
    _focusTrangThai.addListener(_onFocusChange);
    _focusKhoa.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusTenPhong.dispose();
    _focusMaPhong.dispose();
    _focusTrangThai.dispose();
    _focusKhoa.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      ketqua['textTen'] = textTen.text;
      ketqua['textMa'] = textMa.text;
      ketqua['textKhoa'] = textKhoa.text;
      ketqua['textTrangThai'] = textTrangThai.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_screen = MediaQuery.of(context).size.width;
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxecorationContainerSearch,
        margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: CustomContain(
                    containerText: AppLocalizations.of(context)!.translate("id_room"),
                    focusNode: _focusMaPhong,
                    textEditingController: textMa,
                    onPress: () {
                      setState(() {
                        textMa.clear();
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
                    containerText: AppLocalizations.of(context)!.translate("name_room"),
                    focusNode: _focusTenPhong,
                    textEditingController: textTen,
                    onPress: () {
                      setState(() {
                        textTen.clear();
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
                Container(
                  width: 16,
                ),
                Expanded(
                  flex: 2,
                  child: CustomContain(
                    containerText: AppLocalizations.of(context)!.translate("status"),
                    focusNode: _focusTrangThai,
                    textEditingController: textTrangThai,
                    onPress: () {
                      setState(() {
                        textTrangThai.clear();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: width_screen,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("searching"), icon: Qlhk.search, height: 32,press: (){
                        widget.dataSend(ketqua);
                      },)
                    ),
                    Container(
                      width: 16,
                    ),
                    Expanded(
                      flex: 2,
                      child: FixedBottomButton(text: AppLocalizations.of(context)!.translate("adding"), height: 32, icon: Qlhk.add,press: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddEditRoom(
                                  checkAddEdit: true,
                                  listPhongKham: ListPhongKham(
                                      khoa: '',
                                      khoaNoiTru: '',
                                      maPhong: '',
                                      maPhongBhyt: '',
                                      soPhong: '',
                                      tenPhong: '',
                                      chuyenKhoa: '',
                                      loaiPhong: '',
                                      maDauDoc: '',
                                      ghiChu: '',
                                      qrCode: '',
                                      diaChiPhong: '',
                                      maMau: '',
                                      checkPhongGiaoSu: false,
                                      checkDangKiHen: false,
                                      stt: '',
                                      sttPhong: '',
                                      chuyenKhoaDrop: '',
                                      congKham: '',
                                      checkSuDung: false,
                                      id: '',
                                      datLichCsyt: false,
                                      tuVanOnline: false),
                                ))).then((value) {
                          if (value[1] == 'add') {
                            widget.senDataAdd(value[0]);
                          }
                        });
                      },)
                    )
                  ]),
            )
          ],
        ));
  }
}
