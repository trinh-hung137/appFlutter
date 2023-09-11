import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/container/DecorationSearch.dart';
import '../../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../../components/container/CustomContain.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class SearchDVT extends StatelessWidget {
  SearchDVT(
      {Key? key,
      this.onPressAdd,
      this.onPressSearch,
      required this.textEdittingControllerTen,
      required this.textEdittingControllerMa,
      required this.textEdittingControllerHoatChat,
      required this.textEdittingControllerTrangThai,
      required this.focusNodeTen,
      required this.focusNodeMa,
      required this.focusNodeHoatChat,
      required this.focusNodeTrangthai})
      : super(key: key);
  final Function()? onPressAdd;
  final Function()? onPressSearch;
  final TextEditingController textEdittingControllerTen;
  final TextEditingController textEdittingControllerMa;
  final TextEditingController textEdittingControllerHoatChat;
  final TextEditingController textEdittingControllerTrangThai;

  final FocusNode focusNodeTen;
  final FocusNode focusNodeMa;
  final FocusNode focusNodeHoatChat;
  final FocusNode focusNodeTrangthai;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
        padding: EdgeInsets.all(16),
        decoration: BoxecorationContainerSearch,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomContain(
                      containerText:
                          AppLocalizations.of(context)!.translate("medical_id"),
                      focusNode: focusNodeMa,
                      onPress: () {
                        textEdittingControllerMa.clear();
                      },
                      textEditingController: textEdittingControllerMa),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("medical_name"),
                      focusNode: focusNodeTen,
                      onPress: () {
                        textEdittingControllerTen.clear();
                      },
                      textEditingController: textEdittingControllerTen),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("medical_ingredient"),
                      focusNode: focusNodeHoatChat,
                      onPress: () {
                        textEdittingControllerHoatChat.clear();
                      },
                      textEditingController: textEdittingControllerHoatChat),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("state_examination"),
                      focusNode: focusNodeTrangthai,
                      onPress: () {
                        textEdittingControllerTrangThai.clear();
                      },
                      textEditingController: textEdittingControllerTrangThai),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!.translate("searching"),
                    icon: Icons.search_outlined,
                    height: 32,
                    color: Color(0xFF6F9BD4),
                    iconDisplay: true,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    press: () {
                      onPressSearch!();
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: FixedBottomButton(
                    text: AppLocalizations.of(context)!.translate("adding"),
                    icon: Icons.add_circle_outline,
                    height: 32,
                    color: Color(0xFF6F9BD4),
                    iconDisplay: true,
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    press: () {
                      onPressAdd!();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
