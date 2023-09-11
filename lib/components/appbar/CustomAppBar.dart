import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  final bool check;
  final VoidCallback onPress;
  const CustomAppBar({
    Key? key,
    required this.text,
    required this.check,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
      actions: check == true
          ? <Widget>[
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      // size: 14,
                    ),
                  );
                },
              )
            ]
          : null,
      backgroundColor: Color(0xFF6F9BD4),
      leading:GestureDetector(
        onTap: onPress,
        child: Container(
          width: 50,
          height: 50,
          child: Icon(
              Icons.arrow_back_ios,
              size: 14,
            ),
        ),
      ),
    );
  }
}
