import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ToastMessage extends StatelessWidget {
  final String message;
  final ToastGravity gravity;
  final Color color;

  const ToastMessage({
    super.key,
    required this.message,
    required this.color,
    this.gravity = ToastGravity.BOTTOM,
  });

  void showToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showToast(context),
      child: const Icon(LineAwesomeIcons.info_circle),
    );
  }
}
