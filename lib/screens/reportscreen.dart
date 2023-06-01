import 'package:crime_mitigation_system/constants/constants.dart';
import 'package:flutter/material.dart';

class ReportCrime extends StatefulWidget {
  const ReportCrime({super.key});

  @override
  State<ReportCrime> createState() => _ReportCrimeState();
}

TextEditingController _incidentController = TextEditingController();
String? _incident;

class _ReportCrimeState extends State<ReportCrime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Crime'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                  textAlign: TextAlign.center,
                  style: textStyle,
                  'Please note that reporting fasle & misleading Information is punishable by the law'),
              const Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              Text(
                'Make a report',
                style: textStyleBig,
              ),
              SizedBox(
                height: 45,
                child: TextFormField(
                  maxLines: 1,
                  controller: _incidentController,
                  decoration: const InputDecoration(
                    hintText: 'Enter type of incident',
                    labelText: 'Incident type*',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                  onSaved: (newValue) => _incident = newValue,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                    } else if (value.length >= 8) {}
                    return;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return incidentError;
                    }
                    return null;
                  },
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
