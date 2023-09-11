import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/dialog/InputDialog.dart';
import 'package:vncare_qlhk/components/rowflex/RowTextItem.dart';
import 'package:vncare_qlhk/components/schedule/CallDialog.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

class ItemAppointment extends StatelessWidget {
  final String trangThaiLichHen;
  final String trangThaiDenKham;
  final String title;
  final String valueSate;
  final String valueActor;
  final String valueLocation;
  final String valueCause;
  final String valueDate;

  // final VoidCallback onPressed;
  const ItemAppointment(
      {Key? key,
      required this.title,
      required this.valueSate,
      required this.valueActor,
      required this.valueLocation,
      required this.valueCause,
      required this.valueDate,
      required this.trangThaiLichHen,
      required this.trangThaiDenKham})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? titleColor;
    if (trangThaiLichHen == '2') {
      titleColor = TXTXNotiColor;
    } else if (trangThaiLichHen == '0') {
      titleColor = warningColor;
    } else {
      titleColor = primaryColor;
    }
    Color colorValue;
    if (trangThaiDenKham == '2') {
      colorValue = warningColor;
    } else if (trangThaiDenKham == '1') {
      colorValue = TXTXNotiColor;
    } else {
      colorValue = Color(0xFF444444);
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: HuyNotiColor)),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: titleColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8, left: 16, right: 16, bottom: 8),
                      child: Column(
                        children: [
                          RowTextItem(
                              lable: AppLocalizations.of(context)!
                                  .translate('state_physical_examination'),
                              content: valueSate),
                          RowTextItem(
                              lable: AppLocalizations.of(context)!
                                  .translate('patient'),
                              content: valueActor),
                          RowTextItem(
                              lable: AppLocalizations.of(context)!
                                  .translate('clinic'),
                              content: valueLocation),
                          RowTextItem(
                              lable: AppLocalizations.of(context)!
                                  .translate('reason_for_examination'),
                              content: valueCause),
                          RowTextItem(
                              lable: AppLocalizations.of(context)!
                                  .translate('time'),
                              content: valueDate),
                        ],
                      ),
                    ),
                    Visibility(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: FixedBottomButton(
                                    text: AppLocalizations.of(context)!.translate(
                                        'fixed_bottom_button_defuse_offline_detail_title'),
                                    icon: Qlhk.cancel,
                                    height: 32,
                                    press: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return InputDialog();
                                          });
                                    },
                                  )),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: FixedBottomButton(
                                    text: AppLocalizations.of(context)!.translate(
                                        'fixed_bottom_button_accept_offline_detail_title'),
                                    icon: Qlhk.confirm,
                                    height: 32,
                                    press: () {},
                                  ))
                            ],
                          ),
                        ),
                      ),
                      visible: title == 'Mới đăng ký' ? true : false,
                      // maintainSize: widget.title == 'Mới đăng ký'? true : false,
                    )
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: titleColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                  padding:
                      EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // title,
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return CallDialog(phonenumber: "");
                                });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/call/call.svg',
                            width: 24,
                            height: 21,
                          ))
                    ],
                  )),
            ),
          ),
        ]),
      ],
    );
  }
}
