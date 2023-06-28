import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
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
  List<dynamic> notificationData = [];
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
          notificationData = responseData;
          isLoading = false;
        });
      } else {
        setState(() {
          notificationData = [];
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        notificationData = [];
        isLoading = false;
      });
      if (kDebugMode) {
        print('Error fetching notification data: $error');
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
          : notificationData.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  itemCount: notificationData.length,
                  itemBuilder: (context, index) {
                    final report = notificationData[index];
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        LineAwesomeIcons.alternate_trash,
                        size: 100,
                      ),
                      Text(
                        'No Notification',
                        style: textStyleBold,
                      ),
                    ],
                  ),
                ),
    );
  }
}
