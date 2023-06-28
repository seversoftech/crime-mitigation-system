import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/constants.dart';
import '../widgets/reports_widgets.dart';

class NotificationScreen extends StatefulWidget {
  final String userEmail;

  const NotificationScreen({super.key, required this.userEmail});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<dynamic> reports = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final url = '$notificationUrl${widget.userEmail}';

    try {
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body);

      if (responseData != null && responseData is List<dynamic>) {
        setState(() {
          reports = responseData;
          isLoading = false;
        });
      } else {
        setState(() {
          reports = [];
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        reports = [];
        isLoading = false;
      });
      if (kDebugMode) {
        print('Error fetching reports: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            )
          : reports.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final report = reports[index];
                    return ReportCard(
                      incident: Text(report['title'],
                              overflow: TextOverflow.ellipsis),
                      message: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(report['message'],
                              overflow: TextOverflow.ellipsis),
                          Text(report['date']),
                        ],
                      ),
                      severity: Text(report['date']),
                      location: Text(
                        report['date'],
                        style: textStyleBold,
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'No Notification',
                    style: textStyleBold,
                  ),
                ),
    );
  }
}
