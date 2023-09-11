import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/container/DecorationSearch.dart';
import '../../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../../components/container/CustomContain.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class ListSearchFreeDay extends StatelessWidget {
  const ListSearchFreeDay(
      {Key? key,
      this.onPressAdd,
      this.onPressSearch,
      required this.textEditingControllerLoai,
      required this.textEditingControllerNgay,
      required this.focusNodeLoai,
      required this.focusNodeNgay})
      : super(key: key);
  final Function()? onPressAdd;
  final Function()? onPressSearch;

  final TextEditingController textEditingControllerLoai;
  final TextEditingController textEditingControllerNgay;

  final FocusNode focusNodeLoai;
  final FocusNode focusNodeNgay;

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
              children: <Widget>[
                Expanded(
                  child: CustomContain(
                      containerText: AppLocalizations.of(context)!
                          .translate("type_freeday"),
                      focusNode: focusNodeLoai,
                      onPress: () {
                        textEditingControllerLoai.clear();
                      },
                      textEditingController: textEditingControllerLoai),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: CustomContain(
                      containerText:
                          AppLocalizations.of(context)!.translate("freeday"),
                      focusNode: focusNodeNgay,
                      onPress: () {
                        textEditingControllerNgay.clear();
                      },
                      textEditingController: textEditingControllerNgay),
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
