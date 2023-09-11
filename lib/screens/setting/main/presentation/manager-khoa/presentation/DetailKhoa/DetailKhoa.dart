import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/dialog/ErrorDialog.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import '../../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../../config/styles/CustomColor.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/Khoa.dart';
import '../EditKhoa/EditKhoa.dart';
import '../SearchKhoa/ListKhoa.dart';
import '../ViewModelKhoa.dart';
import 'BottomDetailKhoa.dart';
import 'TopDetailKhoa.dart';

class DetailKhoa extends StatefulWidget {
  Department dataList;
  DetailKhoa({Key? key, required this.dataList}) : super(key: key);

  @override
  State<DetailKhoa> createState() => _DetailKhoaState();
}

class _DetailKhoaState extends State<DetailKhoa> {
  late Department department;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    department = widget.dataList;
  }

  @override
  Widget build(BuildContext context) {
    final ViewModelKhoa viewModelKhoa = new ViewModelKhoa();

    MediaQueryData deviceData = MediaQuery.of(context);
    double deviceHeight = deviceData.size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          text: AppLocalizations.of(context)!.translate("appbar_detail_department_title"),
          check: false,
          onPress: () {
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => ListKhoa()),
            //         (route) => false);
            Navigator.of(context).pop(true);
          },
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopDetailKhoa(
                      ma_khoa: widget.dataList.idDep,
                      ma_khoabyt: widget.dataList.idDepYbt,
                      ten_khoa: widget.dataList.name,
                      loai_khoa: widget.dataList.type,
                      chuyen_khoa: widget.dataList.specialty,
                      ma_luu_tr: widget.dataList.idAddress,
                      trang_thai: widget.dataList.state),
                  SizedBox(height: 8),
                  BottomDetailKhoa(
                    s1: widget.dataList.ck1,
                    s2: widget.dataList.ck2,
                    s3: widget.dataList.ck3,
                    s4: widget.dataList.ck4,
                    truongkhoa: widget.dataList.managerDep,
                    hangbh: widget.dataList.levelBh,
                    csyt: widget.dataList.csyt,
                    ghichu: widget.dataList.note,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 24),
              child: widget.dataList.state == TT_KHOA_SU_DUNG
                  ? Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: FixedBottomButton(
                              press: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>EditKhoa(editList: widget.dataList,)));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditKhoa(
                                              editList: widget.dataList,
                                            ))).then((value) {
                                  setState(() {
                                    widget.dataList = value;
                                  });
                                });
                              },
                              text: AppLocalizations.of(context)!.translate("fixed_bottom_edit"),
                              icon: Qlhk.edit,
                              height: 32),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          flex: 1,
                          child: FixedBottomButton(
                              press: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ErrorDialog(
                                        title: AppLocalizations.of(context)!
                                            .translate("dialog_title_confirm"),
                                        message: AppLocalizations.of(context)!
                                            .translate("dialog_message_confirm_delete"),
                                        buttonText:
                                            AppLocalizations.of(context)!.translate("confirm"),
                                        onPress: () {
                                          // department = deleteData(widget.dataList.id.toString(), TT_KHOA_HUY_BO);
                                          viewModelKhoa.deleteKhoa(
                                              widget.dataList.id.toString(), TT_KHOA_HUY_BO);
                                          viewModelKhoa.deletekhoa.listen((event) {
                                            Navigator.of(context).pop(true);
                                          });
                                          //Navigator.push(context,MaterialPageRoute(builder: (context) =>ListKhoa()));
                                          // Navigator.of(context).pop(true);
                                        },
                                      );
                                    }).then((value) {
                                  if (value == true) {
                                    Navigator.of(context).pop(true);
                                  }
                                });
                              },
                              textColor: primaryColor,
                              color: Colors.white,
                              iconColor: primaryColor,
                              border: true,
                              text: AppLocalizations.of(context)!.translate("fixed_bottom_remove"),
                              icon: Qlhk.continue_icon,
                              height: 32),
                        ),
                      ],
                    )
                  : FixedBottomButton(
                      press: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>EditKhoa(editList: widget.dataList,)));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditKhoa(
                                      editList: widget.dataList,
                                    ))).then((value) {
                          setState(() {
                            widget.dataList = value;
                          });
                        });
                      },
                      iconSize: 20,
                      //border: true,
                      text: AppLocalizations.of(context)!.translate("fixed_bottom_edit"),
                      icon: Qlhk.edit,
                      height: 32),
            ),
          ),
        ],
      ),
    );
  }
}
//showAlertDialog
