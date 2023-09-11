import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/item/ItemListView.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';

import '../../../../../../../components/rowflex/RowTextItem.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class ItemServiceCheckup extends StatelessWidget {
  final bool trangThai;
  final String maDichVu;
  final String tenDichVu;
  final String giaTuVan;
  final String giaDatLich;
  const ItemServiceCheckup({
    required this.trangThai,
    required this.maDichVu,
    required this.tenDichVu,
    required this.giaTuVan,
    required this.giaDatLich,
  });

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
          lable: AppLocalizations.of(context)!.translate('name_service'),
          content: tenDichVu,
        ),
        RowTextItem(
          lable: AppLocalizations.of(context)!.translate('id_service'),
          content: maDichVu,
        ),
        RowTextItem(
          lable: AppLocalizations.of(context)!.translate('online_consultation_price'),
          content: giaTuVan,
        ),
        RowTextItem(
          lable: AppLocalizations.of(context)!.translate('clinic_booking_price'),
          content: giaDatLich,
        ),
      ],
    ), widgetTop: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            trangThai == true ? AppLocalizations.of(context)!.translate('effect') : AppLocalizations.of(context)!.translate("expire"),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),titleColor: titleColor,);
  }
}
