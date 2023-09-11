import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

import '../../../../../../../components/container/DecorationSearch.dart';
import '../../data/model/DichVuKham.dart';
import '../../../../../../../components/container/CustomContain.dart';
import '../AddEditService.dart';

class ContainerServiceCheckup extends StatefulWidget {
  final void Function(Map<String, String> ketqua) onData;
  final void Function(DichVuKham dichVuKham) senData;

  ContainerServiceCheckup({
    Key? key,
    required this.onData,
    required this.senData,
  }) : super(key: key);

  @override
  State<ContainerServiceCheckup> createState() =>
      _ContainerServiceCheckupState();
}

class _ContainerServiceCheckupState extends State<ContainerServiceCheckup> {
  final FocusNode _focusTenDV = FocusNode();
  final FocusNode _focusMaDV = FocusNode();
  final FocusNode _focusTrangThai = FocusNode();
  final FocusNode _focusTuVan = FocusNode();
  final FocusNode _focusDatLich = FocusNode();

  final TextEditingController textTen = TextEditingController();
  final TextEditingController textMa = TextEditingController();
  final TextEditingController textTrangThai = TextEditingController();
  final TextEditingController textTuVan = TextEditingController();
  final TextEditingController textDatLich = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusTenDV.addListener(_onFocusChange);
    _focusMaDV.addListener(_onFocusChange);
    _focusTrangThai.addListener(_onFocusChange);
    _focusTuVan.addListener(_onFocusChange);
    _focusDatLich.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusTenDV.dispose();
    _focusMaDV.dispose();
    _focusTrangThai.dispose();
    _focusTuVan.dispose();
    _focusDatLich.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      ketqua['textTen'] = textTen.text;
      ketqua['textMa'] = textMa.text;
      ketqua['textTrangThai'] = textTrangThai.text;
      ketqua['textTuVan'] = textTuVan.text;
      ketqua['textDatLich'] = textDatLich.text;
    });
  }

  Map<String, String> ketqua = {};

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxecorationContainerSearch,
        margin: EdgeInsets.only(top: 8,left: 16,right: 16),
        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomContain(
                    containerText: AppLocalizations.of(context)!.translate('name_service'),
                    focusNode: _focusTenDV,
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
                    containerText: AppLocalizations.of(context)!.translate('id_service'),
                    focusNode: _focusMaDV,
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
                    containerText: AppLocalizations.of(context)!.translate('status'),
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
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: CustomContain(
                    containerText: AppLocalizations.of(context)!.translate('online_consultation_price'),
                    focusNode: _focusTuVan,
                    textEditingController: textTuVan,
                    onPress: () {
                      setState(() {
                        textTuVan.clear();
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
                    containerText: AppLocalizations.of(context)!.translate('clinic_booking_price'),
                    focusNode: _focusDatLich,
                    textEditingController: textDatLich,
                    onPress: () {
                      setState(() {
                        textDatLich.clear();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: FixedBottomButton(
                        text: AppLocalizations.of(context)!.translate('searching'),
                        icon: Qlhk.search,
                        height: 32,
                        press: () {
                          widget.onData(ketqua);
                        },
                      ),
                    ),
                    Container(
                      width: 16,
                    ),
                    Expanded(
                      flex: 2,
                      child: FixedBottomButton(
                        text: AppLocalizations.of(context)!.translate('adding'),
                        icon: Qlhk.add,
                        height: 32,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddServiceCheckup(
                                        check: true,
                                        dichvukham: DichVuKham(
                                          maDichVu: '',
                                          tenDichVu: '',
                                          phiTuVanCu: '',
                                          phiTuVanMoi: '',
                                          phiDatLichCu: '',
                                          phiDatLichMoi: '',
                                          ngayAdGiaMoi: '',
                                          trangThai: false,
                                          listPhong: [],
                                          id: '',
                                        ),
                                      ))).then((value) {
                            if (value[1] == 'add') {
                              widget.senData(value[0]);
                            }
                          });
                        },
                      ),
                    )
                  ]),
            )
          ],
        ));
  }
}
