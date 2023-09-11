import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final BoxecorationContainerSearch = BoxDecoration(
  color: Color(0xFFBCD2EF),
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 2,
      offset: Offset(0, 2), // changes position of shadow
    ),
  ],
);
