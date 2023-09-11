import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../../../../utils/AppLocalizations.dart';

class LineStart extends StatelessWidget {
  const LineStart(
      {Key?key, required this.isCheckAll, required this.onClickIcon}):super(key:key);
  final bool isCheckAll;
  final Function(bool) onClickIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: const Color(0xFF6F9BD4),
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Align(
                alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () {
                      onClickIcon(!isCheckAll);
                    },
                    icon: Icon(
                      isCheckAll
                          ? Icons.check_box_outlined
                          : Icons.crop_square_outlined,
                      size: 20,
                    ),
                    color: Colors.white,
                  ))),
        ),
        Expanded(
          child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: const Color(0xFF6F9BD4),
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child:  Center(
                child: Text(
                  AppLocalizations.of(context)!.translate("number"),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
        Expanded(
          child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: const Color(0xFF6F9BD4),
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child:  Center(
                  child: Text(AppLocalizations.of(context)!.translate("order_time"),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)))),
        )
      ],
    );
  }
}