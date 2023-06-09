import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ShowSuccessMessage {
  static void show(BuildContext context, String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        elevation: 0,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  overflow: TextOverflow.ellipsis,
                  message,
                  style: textStyleBold),
              const Icon(
                LineAwesomeIcons.check_circle,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
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

class ShowErrorMessage {
  static void show(BuildContext context, String message) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
      SnackBar(
        elevation: 0,
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  overflow: TextOverflow.ellipsis,
                  message,
                  style: textStyleBold),
              const Icon(
                LineAwesomeIcons.times_circle,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
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
