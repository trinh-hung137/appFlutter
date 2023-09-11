import 'package:flutter/material.dart';
import '../../../../../../../components/checkbox/ListCheckBox.dart';
import '../../../../../../../components/container/Decoration.dart';
import '../../../../../../../components/rowflex/RowTextView.dart';
import '../../../../../../../utils/AppLocalizations.dart';

class BottomDetailKhoa extends StatefulWidget {
  final bool? s1;
  final bool? s2;
  final bool? s3;
  final bool? s4;
  final String? truongkhoa;
  final String? hangbh;
  final String? csyt;
  final String? ghichu;

  const BottomDetailKhoa({
    Key? key,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.s4,
    required this.truongkhoa,
    required this.hangbh,
    required this.csyt,
    required this.ghichu,
  }) : super(key: key);

  @override
  State<BottomDetailKhoa> createState() => _BottomDetailKhoaState();
}

class _BottomDetailKhoaState extends State<BottomDetailKhoa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxecorationContainer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //CustomTextCheckbox(checkIcon: false, text: 'Nhan cap cuu', onpress: (){}),
          //CustomButtonCheckbox(height: 20, textButton: 'Nhan cap cuu', onPressed: (){}, checkIcon: false),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListCheckBox(
                    checkIcon: widget.s1!,
                    text: AppLocalizations.of(context)!.translate("receive_emergency"),
                    onpress: () {}),
                ListCheckBox(
                    checkIcon: widget.s2!,
                    text: AppLocalizations.of(context)!.translate("receive_pttt"),
                    onpress: () {}),
                ListCheckBox(
                    checkIcon: widget.s3!,
                    text: AppLocalizations.of(context)!.translate("choose_bed_when_you_move_in"),
                    onpress: () {}),
                ListCheckBox(
                    checkIcon: widget.s4!,
                    text: AppLocalizations.of(context)!
                        .translate("calculate_invoices_according_to_accounting_source"),
                    onpress: () {}),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              children: [
                RowTextView(
                    lable: AppLocalizations.of(context)!.translate("manager_department"),
                    content: widget.truongkhoa!,
                    flexItemLeft: 3,
                    flexItemRight: 4),
                RowTextView(
                    lable: AppLocalizations.of(context)!.translate("level_bhyt_left_line"),
                    content: widget.hangbh!,
                    flexItemLeft: 3,
                    flexItemRight: 4),
                RowTextView(
                    lable: AppLocalizations.of(context)!.translate("health_facilities"),
                    content: widget.csyt!,
                    flexItemLeft: 3,
                    flexItemRight: 4),
                RowTextView(
                    lable: AppLocalizations.of(context)!.translate("note"),
                    content: widget.ghichu!,
                    flexItemLeft: 3,
                    flexItemRight: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
