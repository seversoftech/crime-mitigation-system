import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../models/models.dart';
import '../widgets/reports_widgets.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return ReportCard(
            title: report.title,
            message: report.message,
            time: report.time,
            iconData: report.iconData,
          );
        },
      ),
    );
  }
}

final List<ReportItem> reports = [
  const ReportItem(
    title: 'Recieved Report',
    message: 'You have a new message from Admin.',
    time: '6h ago',
    iconData: LineAwesomeIcons.history,
  ),
  const ReportItem(
    title: 'Recieved Report',
    message: 'You have a new message from Admin.',
    time: '2h ago',
    iconData: LineAwesomeIcons.history,
  ),
  const ReportItem(
    title: 'Recieved Report',
    message: 'You have a new message from Admin.',
    time: '1h ago',
    iconData: LineAwesomeIcons.history,
  ),
  const ReportItem(
    title: 'Recieved Report',
    message: 'You have a new message from Admin.',
    time: '7h ago',
    iconData: LineAwesomeIcons.history,
  ),
  const ReportItem(
    title: 'Recieved Report',
    message: 'You have a new message from Admin.',
    time: '3d ago',
    iconData: LineAwesomeIcons.history,
  ),
];
