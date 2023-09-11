import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/container/Decoration.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDichVuKham/presentation/ServiceViewModel.dart';

import '../../../../../../components/appbar/CustomAppBar.dart';
import '../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../qlhk_icons.dart';
import '../../../../../../utils/AppLocalizations.dart';
import '../data/model/DichVuKham.dart';
import 'AddEditService.dart';

// ignore: must_be_immutable
class DetailServiceCheckup extends StatefulWidget {
  DichVuKham dichvukham;

  DetailServiceCheckup({
    Key? key,
    required this.dichvukham,
  }) : super(key: key);

  @override
  State<DetailServiceCheckup> createState() => _DetailServiceCheckupState();
}

class _DetailServiceCheckupState extends State<DetailServiceCheckup> {
  ServiceViewModel serviceViewModel = new ServiceViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          text: AppLocalizations.of(context)!.translate("detail_service_appbar"),
          check: false,
          onPress: () {
            Navigator.pop(context, [widget.dichvukham, 'sua']);
          },
        ),
      ),
      body: Container(
          decoration: BoxecorationContainer,
          margin: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
          padding: EdgeInsets.only(top: 8,left: 16,right: 16,bottom: 8),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("id_service"),
                content: widget.dichvukham.maDichVu,
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("name_service"),
                content: widget.dichvukham.tenDichVu,
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("online_consultation_price_old"),
                content: widget.dichvukham.phiTuVanCu,
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("online_consultation_price_new"),
                content: widget.dichvukham.phiTuVanMoi,
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("clinic_booking_price_old"),
                content: widget.dichvukham.phiDatLichCu,
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("clinic_booking_price_new"),
                content: widget.dichvukham.phiDatLichMoi,
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("date_add_price"),
                content: widget.dichvukham.ngayAdGiaMoi,
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
              RowTextView(
                lable: AppLocalizations.of(context)!.translate("status"),
                content: widget.dichvukham.trangThai == true
                    ? AppLocalizations.of(context)!.translate("effect")
                    : AppLocalizations.of(context)!.translate("expire"),
                flexItemLeft: 2,
                flexItemRight: 2,
              ),
            ],
          )),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 64,
        child: Row(
          children: [
            Container(
              width: 16,
            ),
            Expanded(
              child: FixedBottomButton(
                text: AppLocalizations.of(context)!.translate("fixed_bottom_remove"),
                icon: Qlhk.cancel,
                height: 32,
                color: Color(0xFF6F9BD4),
                press: () {
                  print(
                      'DetailService -> yêu cầu xóa dịch vụ khám có id = ${widget.dichvukham.id}');
                  Navigator.pop(context, [widget.dichvukham.id, 'xoa']);
                  deleteData();
                },
              ),
            ),
            Container(
              width: 8,
            ),
            Expanded(
              child: FixedBottomButton(
                text: AppLocalizations.of(context)!.translate("fixed_bottom_button_edit_offline_detail_title"),
                icon: Qlhk.edit,
                height: 32,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddServiceCheckup(
                              check: false,
                              dichvukham: widget.dichvukham))).then((value) {
                    if (value[1] == 'edit') {
                      loadData(value[0]);
                    }
                  });
                },
              ),
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
      serviceViewModel.deleteServicee(widget.dichvukham.id);
    }catch(e){
      print('DetailService => Lỗi call api xóa: ${e.toString()} ');
    }
    // String apiUrl = 'https://64d2f44d67b2662bf3db88c8.mockapi.io/';
    // String param = 'dichVuKham/${widget.dichvukham.id}';
    // await BaseApiNoToken().delete(apiUrl, param);
  }

  void loadData(DichVuKham value) {
    setState(() {
      widget.dichvukham = value;
      print('DetailService -> dịch vụ khám sau khi sửa: ${widget.dichvukham}');
    });
  }
}
