import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

    final url =
        'http://192.168.139.214/crimemitigation/report_history.php?user_email=${widget.userEmail}';

    try {
      final response = await http.get(Uri.parse(url));
      final responseData = json.decode(response.body);
     

      setState(() {
        reports = responseData['reports'];
        isLoading = false;
      });
    } catch (error) {
      setState(() {
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
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            )
          : ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];

                return ListTile(
                  title: Text(report['title']),
                  subtitle: Text(report['description']),
                  // Add more details or customize the ListTile as needed
                );
              },
            ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ReportList(userEmail: 'user@useremail.com'),
//   ));
// }
