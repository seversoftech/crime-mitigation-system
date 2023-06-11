import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ShowMessage {
  static void show(BuildContext context, String message,
      {required MaterialColor color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 3000),
        backgroundColor: color,
        content: Text(
          message,
          style: textStyle,
        ),
      ),
    );
  }
}
