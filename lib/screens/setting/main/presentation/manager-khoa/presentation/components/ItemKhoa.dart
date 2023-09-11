import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/item/ItemListView.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextItem.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/utils/Constants.dart';

import '../../../../../../../utils/AppLocalizations.dart';

class ItemKhoa extends StatelessWidget {
  final String? maKhoa;
  final String? tenKhoa;
  final String? truongKhoa;
  final String? trangThai;
  const ItemKhoa(
      {Key? key,
        required this.maKhoa,
        required this.tenKhoa,
        required this.truongKhoa,
        required this.trangThai
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemListView(
        titleColor: trangThai == TT_KHOA_SU_DUNG ? primaryColor : warningColor,
        widgetTop: Row(
          children: [
            Container(
              child: Text(
                trangThai!,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
        widgetBottom: Column(
          children: [
            RowTextItem(lable: AppLocalizations.of(context)!
                .translate('id_department'), content: maKhoa!),
            RowTextItem(lable: AppLocalizations.of(context)!
                .translate('name_department'), content: tenKhoa!),
            RowTextItem(lable: AppLocalizations.of(context)!
                .translate('manager_department'), content: truongKhoa!),
            RowTextItem(lable: AppLocalizations.of(context)!
                .translate('status'), content: trangThai!)
          ],
        )
    );
  }
}
