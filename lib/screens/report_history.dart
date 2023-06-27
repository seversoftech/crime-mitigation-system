import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/constants.dart';
import '../widgets/reports_widgets.dart';

class ReportList extends StatefulWidget {
  final String userEmail;

  ReportList({required this.userEmail});

  @override
  _ReportListState createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
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
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : reports.isNotEmpty
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  itemCount: reports.length,
                  itemBuilder: (context, index) {
                    final report = reports[index];
                    // return ListTile(
                    //   leading: const Icon(LineAwesomeIcons.history),
                    //   title: Text(report['incident']),
                    //   subtitle: Text(report['description']),
                    //   // Add more details or customize the ListTile as needed
                    // );
                    return ReportCard(
                      title: Text(report['incident']),
                      message: Text(report['description']),
                      time: Text(report['date']),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'No reports available.',
                    style: textStyle,
                  ),
                ),
    );
  }
}
