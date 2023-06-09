import 'package:crime_mitigation_system/widgets/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:convert';

import '../constants/constants.dart';
import '../widgets/reports_widgets.dart';

class ReportHistroy extends StatefulWidget {
  final String userEmail;

  const ReportHistroy({super.key, required this.userEmail});

  @override
  ReportHistroyState createState() => ReportHistroyState();
}

class ReportHistroyState extends State<ReportHistroy> {
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

    final url = '$historyUrl${widget.userEmail}';

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
        title: const Text('Report History'),
      ),
      body: isLoading
          ? const Center(child: Loading())
          : reports.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final report = reports[index];
                    return ReportCard(
                      incident: Text(report['incident'],
                          overflow: TextOverflow.ellipsis),
                      message: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(report['description'],
                              overflow: TextOverflow.ellipsis),
                          Text(report['date']),
                        ],
                      ),
                      severity: Text(report['severity']),
                      location: Text(
                        report['location'],
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
                        'No reports available.',
                        style: textStyleBold,
                      ),
                    ],
                  ),
                ),
    );
  }
}
