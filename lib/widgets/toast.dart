import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast extends StatelessWidget {
  final String message;
  final ToastGravity gravity;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  Toast({
    required this.message,
    this.gravity = ToastGravity.BOTTOM,
    this.backgroundColor = Colors.black54,
    this.textColor = Colors.white,
    this.fontSize = 16.0,
  });

  void showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showToast(context),
      child: Icon(Icons.info_outline),
    );
  }
}
