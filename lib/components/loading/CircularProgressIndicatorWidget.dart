import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
