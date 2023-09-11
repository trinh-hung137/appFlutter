import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/container/Decoration.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextItem.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextView.dart';

import '../../../../../../../components/button/CustomButtonCheckbox.dart';
import '../../../../../../../utils/AppLocalizations.dart';
// ignore: must_be_immutable
class ItemSelectRoom extends StatelessWidget {
  final String tenPhong;
  final String maPhong;
  bool ktraTuVan;
  final VoidCallback onClickTuVan;
  final VoidCallback onClickDatLich;
  bool ktraDatLich;
  ItemSelectRoom(
      {Key? key,
        required this.tenPhong,
        required this.maPhong,
        required this.onClickTuVan,
        required this.onClickDatLich,
        required this.ktraTuVan,
        required this.ktraDatLich})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxecorationContainer,
      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          RowTextItem(lable: AppLocalizations.of(context)!.translate('name_room'), content: tenPhong),
          RowTextItem(lable: AppLocalizations.of(context)!.translate('id_room'), content:maPhong ),
          SizedBox(height: 8,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: CustomButtonCheckbox(
                        height: 32,
                        textButton: AppLocalizations.of(context)!.translate('online_consultation'),
                        checkIcon: ktraTuVan,
                        onPressed: onClickTuVan),
                  ),
                  Container(
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomButtonCheckbox(
                        height: 32,
                        checkIcon: ktraDatLich,
                        textButton: AppLocalizations.of(context)!.translate('clinic_booking'),
                        onPressed: onClickDatLich),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
