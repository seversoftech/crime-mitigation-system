import 'package:flutter/material.dart';

import '../constants/constants.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData iconData;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(iconData),
        title: Text(title, style: textStyleBold),
        subtitle: Text(message),
        trailing: Text(time),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
