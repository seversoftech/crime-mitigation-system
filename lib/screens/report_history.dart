import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/constants.dart';
import '../models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
];

// Define a function to fetch and display user details
Future<void> fetchHistory() async {
  final url = historyUrl;

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List<dynamic> userDetails = data['userDetails'];

      // Display the user details
      for (var userDetail in userDetails) {
        // Access the specific details you need and display them
        final username = userDetail['username'];
        final email = userDetail['email'];
        final age = userDetail['age'];

        print('Username: $username');
        print('Email: $email');
        print('Age: $age');
      }
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('Exception: $e');
  }
}
