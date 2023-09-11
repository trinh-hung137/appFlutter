import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/styles/CustomColor.dart';
import '../container/Decoration.dart';

class ItemListView extends StatelessWidget {
  final Widget widgetTop;
  final Color? titleColor;
  final Widget widgetBottom;
  const ItemListView({Key? key, required this.widgetTop, this.titleColor, required this.widgetBottom,}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8, left: 16,right: 16),
      child: Stack(
          children: [
            Container(
              decoration: BoxecorationContainer,
              padding: EdgeInsets.only(left: 16,right: 16, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 37,
                    decoration: BoxDecoration(
                      // color: titleColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  widgetBottom,
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: titleColor ?? primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Padding(
                  padding:
                  EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
                  child: widgetTop),
            ),
          ]
      ),
    );
  }
}
