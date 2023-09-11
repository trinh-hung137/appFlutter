import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextItem.dart';

import '../../../../../../../components/container/Decoration.dart';
import '../../../../../../../utils/AppLocalizations.dart';
import '../../data/model/DVT.dart';
import '../DetailDVT.dart';

class ItemQLDVT extends StatelessWidget {
  const ItemQLDVT(
      {Key? key,
      required this.dvt, this.onPressItem})
      : super(key: key);
  final DuocVatTu dvt;

  final Function()? onPressItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          onPressItem!();
        },
        child: Container(
          decoration: BoxecorationContainer,
          margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                height: 35,
                decoration: BoxDecoration(
                    color: dvt.sudung!
                        ? const Color(0xFF6F9BD4)
                        : const Color(0xFFB43939),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dvt.sudung == true
                        ? AppLocalizations.of(context)!.translate("effect")
                        : AppLocalizations.of(context)!.translate("expire"),
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  children: [
                    RowTextItem(lable: AppLocalizations.of(context)!
                        .translate("medical_id"), content: dvt.ma!),
                    RowTextItem(lable: AppLocalizations.of(context)!
                        .translate("medical_name"), content: dvt.ten!),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("medical_ingredient"), content: dvt.hoatchat!),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("allocation_units"),
                        content: dvt.dvcapphat!),
                    RowTextItem(
                        lable: AppLocalizations.of(context)!
                            .translate("content"), content: dvt.hamluong!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
