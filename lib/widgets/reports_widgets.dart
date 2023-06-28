import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ReportCard extends StatelessWidget {
  final Widget incident;
  final Widget message;
  final Widget severity;
  final Widget location;

  const ReportCard({
    Key? key,
    required this.incident,
    required this.message,
    required this.severity,
    required this.location,
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
        title: incident,
        subtitle: message,
        trailing: severity,
      ),
    );
  }
}
