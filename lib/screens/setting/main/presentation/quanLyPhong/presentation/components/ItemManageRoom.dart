import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/item/ItemListView.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';

import '../../../../../../../components/rowflex/RowTextItem.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class ItemManageRoom extends StatelessWidget {
  final bool trangThai;
  final String maPhong;
  final String tenPhong;
  final String khoa;
  const ItemManageRoom(
      {Key? key,
        required this.trangThai,
        required this.maPhong,
        required this.tenPhong,
        required this.khoa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? titleColor;
    if (trangThai == false) {
      titleColor = warningColor;
    } else {
      titleColor = primaryColor;
    }
    return ItemListView(widgetBottom: Column(
      children: [
        RowTextItem(
          lable: AppLocalizations.of(context)!.translate("id_room"),
          content: maPhong,
        ),
        RowTextItem(
          lable: AppLocalizations.of(context)!.translate("name_room"),
          content: tenPhong,
        ),
        RowTextItem(
          lable: AppLocalizations.of(context)!.translate("department"),
          content: khoa,
        ),
        RowTextItem(
          lable: AppLocalizations.of(context)!.translate("status"),
          content: trangThai == false ? AppLocalizations.of(context)!.translate("status_cancel") : AppLocalizations.of(context)!.translate("status_use"),
        ),
      ],
    ), widgetTop: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            // title,
            trangThai == false ? AppLocalizations.of(context)!.translate("status_cancel") : AppLocalizations.of(context)!.translate("status_use"),
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    ),
      titleColor: titleColor,
    );
  }
}
