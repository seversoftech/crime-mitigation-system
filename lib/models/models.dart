import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final IconData iconData;

  const NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.iconData,
  });
}

class ReportItem {
  final String title;
  final String message;
  final String time;
  final IconData iconData;

  const ReportItem({
    required this.title,
    required this.message,
    required this.time,
    required this.iconData,
  });
}
