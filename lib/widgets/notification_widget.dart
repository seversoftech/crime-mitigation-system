import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NotificationWidget extends StatelessWidget {
  final Widget title;
  final Widget message;
  final Widget time;

  const NotificationWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: const Icon(LineAwesomeIcons.bell),
        title: title,
        subtitle: message,
        trailing: time,
      ),
    );
  }
}
