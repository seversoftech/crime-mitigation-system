import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ShowMessage {
  static void show(BuildContext context, String message, {required Color backgroundColor}) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
