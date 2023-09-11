import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/container/CustomContain.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import '../../../../../../../components/button/FixedBottomButton.dart';
import '../../../../../../../components/container/DecorationSearch.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class SearchKhoa extends StatefulWidget {
  final Function() clickAdd;
  final Function(List<String>) clickSearch;
  const SearchKhoa({key, required this.clickAdd, required this.clickSearch});

  @override
  State<SearchKhoa> createState() => _SearchKhoaState();
}

class _SearchKhoaState extends State<SearchKhoa> {
  FocusNode focusTruongkhoa = FocusNode();
  FocusNode focusMakhoa = FocusNode();
  FocusNode focusTenkhoa = FocusNode();
  FocusNode focusTrangthai = FocusNode();

  TextEditingController makhoaController = TextEditingController();
  TextEditingController tenkhoaController = TextEditingController();
  TextEditingController truongkhoaController = TextEditingController();
  TextEditingController trangthaiController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusMakhoa.addListener(_onFocusChange);
    focusTenkhoa.addListener(_onFocusChange);
    focusTruongkhoa.addListener(_onFocusChange);
    focusTrangthai.addListener(_onFocusChange);
  }

  List<String> result = ['', '', '', ''];
  void _onFocusChange() {
    setState(() {
      result[0] = makhoaController.text;
      result[1] = tenkhoaController.text;
      result[2] = truongkhoaController.text;
      result[3] = trangthaiController.text;
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusMakhoa.dispose();
    focusTenkhoa.dispose();
    focusTruongkhoa.dispose();
    focusTrangthai.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    double deviceHeight = deviceData.size.height;

    return Container(
      decoration: BoxecorationContainerSearch,
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CustomContain(
                          containerText: AppLocalizations.of(context)!.translate('id_department'),
                          onPress: () {
                            makhoaController.clear();
                          },
                          textEditingController: makhoaController,
                          focusNode: focusMakhoa)),
                  SizedBox(width: 16),
                  Expanded(
                      flex: 1,
                      child: CustomContain(
                          containerText: AppLocalizations.of(context)!.translate('name_department'),
                          onPress: () {
                            tenkhoaController.clear();
                          },
                          textEditingController: tenkhoaController,
                          focusNode: focusTenkhoa)),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CustomContain(
                          containerText:
                              AppLocalizations.of(context)!.translate('manager_department'),
                          onPress: () {
                            truongkhoaController.clear();
                          },
                          textEditingController: truongkhoaController,
                          focusNode: focusTruongkhoa)),
                  SizedBox(width: 16),
                  Expanded(
                      flex: 1,
                      child: CustomContain(
                          containerText: AppLocalizations.of(context)!.translate('status'),
                          onPress: () {
                            trangthaiController.clear();
                          },
                          textEditingController: trangthaiController,
                          focusNode: focusTrangthai)),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: FixedBottomButton(
                        text: AppLocalizations.of(context)!.translate('searching'),
                        icon: Qlhk.search,
                        height: 32,
                        press: () {
                          widget.clickSearch(result);
                        })),
                SizedBox(width: 16),
                Expanded(
                    flex: 1,
                    child: FixedBottomButton(
                      text: AppLocalizations.of(context)!.translate('adding'),
                      icon: Qlhk.add,
                      height: 32,
                      press: () {
                        widget.clickAdd();
                      },
                    )),
              ],
            ),
            //)
          ],
        ),
      ),
    );
  }
}
