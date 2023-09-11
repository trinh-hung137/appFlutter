import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

import '../../../../../../../components/container/CustomContain.dart';
import '../../../../../../../components/container/DecorationSearch.dart';

class ContainerSelectRoom extends StatefulWidget {
  final void Function(Map<String, String> resultTimKiem) dataSend;
  ContainerSelectRoom({
    Key? key,
    required this.dataSend,
  }) : super(key: key);

  @override
  State<ContainerSelectRoom> createState() => _ContainerSelectRoomState();
}

class _ContainerSelectRoomState extends State<ContainerSelectRoom> {
  final FocusNode _focusTenPhong = FocusNode();
  final FocusNode _focusMaPhong = FocusNode();
  final FocusNode _focusTuVan = FocusNode();
  final FocusNode _focusDatLich = FocusNode();

  final TextEditingController textTen = TextEditingController();
  final TextEditingController textMa = TextEditingController();
  final TextEditingController textDatLich = TextEditingController();
  final TextEditingController textTuVan = TextEditingController();

  Map<String, String> resultTimKiem = {};

  @override
  void initState() {
    super.initState();
    _focusTenPhong.addListener(_onFocusChange);
    _focusMaPhong.addListener(_onFocusChange);
    _focusTuVan.addListener(_onFocusChange);
    _focusDatLich.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusMaPhong.dispose();
    _focusTenPhong.dispose();
    _focusTuVan.dispose();
    _focusDatLich.dispose();

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      resultTimKiem['textTen'] = textTen.text;
      resultTimKiem['textMa'] = textMa.text;
      resultTimKiem['textTuVan'] = textTuVan.text;
      resultTimKiem['textDatLich'] = textDatLich.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width_screen = MediaQuery.of(context).size.width;
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
                    containerText: AppLocalizations.of(context)!.translate('name_room'),
                    focusNode: _focusTenPhong,
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
                    containerText: AppLocalizations.of(context)!.translate('id_room'),
                    focusNode: _focusMaPhong,
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
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
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
                Container(
                  width: 16,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 18,
                          width: width_screen / 2,
                        ),
                        SizedBox(height: 4),
                        FixedBottomButton(text:AppLocalizations.of(context)!.translate('searching'), icon: Qlhk.search, height: 32,press: (){
                          widget.dataSend(resultTimKiem);
                        },)
                      ]),
                )
              ],
            ),
          ],
        ));
  }
}
