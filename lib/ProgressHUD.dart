import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Color? loadingColor;
  final Animation<Color>? valueColor;

  ProgressHUD(
      {Key? key,
      required this.child,
      required this.inAsyncCall,
      this.opacity = 0.3,
      this.color = Colors.grey,
      this.valueColor,
      this.loadingColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = List<Widget>.empty(growable: true);
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
              child: new CircularProgressIndicator(
            color: loadingColor ?? primaryColor,
          )),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
