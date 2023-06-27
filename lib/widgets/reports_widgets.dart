import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/constants.dart';

class ReportCard extends StatelessWidget {
  final Widget title;
  final Widget message;
  final Widget time;

  const ReportCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: const Icon(LineAwesomeIcons.history),
        title: title,
        subtitle: message,
        trailing: time,
        onTap: () {
          // Handle Report tap
        },
      ),
    );
  }
}
