import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/item/ItemListView.dart';

import '../../../../../../../components/rowflex/RowTextItem.dart';
import '../../../../../../../config/styles/CustomColor.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class ItemManageStaff extends StatelessWidget {
  final String maNV;
  final String maBacSy;
  final String tenNV;
  final String khoa;
  final String loaiNV;
  final String phong;

  const ItemManageStaff(
      {Key? key,
      required this.maNV,
      required this.maBacSy,
      required this.tenNV,
      required this.khoa,
      required this.loaiNV,
      required this.phong})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemListView(
      widgetBottom: Column(
        children: [
          RowTextItem(
              lable: AppLocalizations.of(context)!.translate("id_staff"),
              content: maNV,
              ),
          RowTextItem(
              lable: AppLocalizations.of(context)!.translate("id_doctor"),
              content: maBacSy,
              ),
          RowTextItem(
              lable: AppLocalizations.of(context)!.translate("name_staff"),
              content: tenNV,
              ),
          RowTextItem(
              lable: AppLocalizations.of(context)!.translate("type_staff"),
              content: loaiNV,
              ),
          RowTextItem(
              lable: AppLocalizations.of(context)!.translate("department"), content: khoa,),
          RowTextItem(
              lable: AppLocalizations.of(context)!.translate("room"),
              content: phong,
              ),
        ],
      ),
      widgetTop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              maNV,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
