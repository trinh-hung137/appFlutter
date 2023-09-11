import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';

import '../../../../../../../components/container/Decoration.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class TopDetailKhoa extends StatelessWidget {
  final String? ma_khoa;
  final String? ma_khoabyt;
  final String? ten_khoa;
  final String? loai_khoa;
  final String? chuyen_khoa;
  final String? ma_luu_tr;
  final String? trang_thai;
  const TopDetailKhoa(
      {Key? key,
      required this.ma_khoa,
      required this.ma_khoabyt,
      required this.ten_khoa,
      required this.loai_khoa,
      required this.chuyen_khoa,
      required this.ma_luu_tr,
      this.trang_thai})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxecorationContainer,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            RowTextView(
                lable: AppLocalizations.of(context)!.translate('id_department'),
                content: ma_khoa!,
                flexItemLeft: 2,
                flexItemRight: 3),
            RowTextView(
                lable: AppLocalizations.of(context)!.translate("id_department_byt"),
                content: ma_khoabyt!,
                flexItemLeft: 2,
                flexItemRight: 3),
            RowTextView(
                lable: AppLocalizations.of(context)!.translate("name_department"),
                content: ten_khoa!,
                flexItemLeft: 2,
                flexItemRight: 3),
            RowTextView(
                lable: AppLocalizations.of(context)!.translate("type_department"),
                content: loai_khoa!,
                flexItemLeft: 2,
                flexItemRight: 3),
            RowTextView(
                lable: AppLocalizations.of(context)!.translate("medical_specialt_department"),
                content: chuyen_khoa!,
                flexItemLeft: 2,
                flexItemRight: 3),
            RowTextView(
                lable: AppLocalizations.of(context)!.translate("residence_code"),
                content: ma_luu_tr!,
                flexItemLeft: 2,
                flexItemRight: 3),
            RowTextView(
                lable: AppLocalizations.of(context)!.translate("status"),
                content: trang_thai!,
                flexItemLeft: 2,
                flexItemRight: 3),
          ],
        ),
      ),
    );
  }
}
