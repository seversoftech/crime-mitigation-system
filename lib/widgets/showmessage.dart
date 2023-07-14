import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ShowMessage {
  static void show(BuildContext context, String message,
      {required Color backgroundColor}) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message, style: textStyleBold),
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16.0),
        animation: CurvedAnimation(
          parent: AnimationController(
            vsync: scaffoldMessenger,
            duration: const Duration(milliseconds: 500),
          ),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}


