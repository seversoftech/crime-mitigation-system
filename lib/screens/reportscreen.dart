// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/constants.dart';
import '../main.dart';
import '../widgets/elevatedButton.dart';
import '../widgets/loading.dart';
import '../widgets/showmessage.dart';

class ReportCrime extends StatefulWidget {
  const ReportCrime({super.key});

  @override
  State<ReportCrime> createState() => _ReportCrimeState();
}

class _ReportCrimeState extends State<ReportCrime> {
  CameraController? _controller;

  Future<void>? _initializeControllerFuture;
  final _formKey = GlobalKey<FormState>();
  final _storage = const FlutterSecureStorage();

  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _incidentController = TextEditingController();
  final TextEditingController _severityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd HH:mm:ss').format(
      DateTime.now(),
    ),
  );

  Future<void> _readFromStorage() async {
    _emailController.text = await _storage.read(key: "KEY_EMAIL") ?? '';
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
    _controller = CameraController(cameras![0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future sendReport() async {
    await _storage.write(key: "KEY_EMAIL", value: _emailController.text);
    await _initializeControllerFuture;

    final image = await _controller!.takePicture();

    try {
      var url = reportUrl;
      var response = await http.post(
        url,
        body: {
          "user_email": _emailController.text,
          "incident": _incidentController.text,
          "date": _dateController.text,
          "severity": _severityController.text,
          "location": _locationController.text,
          "description": _descriptionController.text,
          "image": image.name
        },
      );

      var data = json.decode(response.body);

      // print(response.body);

      if (data == "Success") {
        ShowMessage.show(
          context,
          color: Colors.green,
          'Report Sent!',
        );
        Navigator.pop(context);
      } else {
        ShowMessage.show(
          context,
          color: Colors.red,
          'An error occured...',
        );
      }
    } catch (exception) {
      // print('Exception caught: $exception');

      ShowMessage.show(
        context,
        color: Colors.red,
        'An error occurred: $exception',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final halfWidth = screenWidth / 2;
    final halfHeight = screenHeight / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Crime'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                          textAlign: TextAlign.center,
                          style: textStyleWarning,
                          'Please note that reporting fasle & misleading Information is punishable by the law'),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      Text(
                        'Make a report',
                        style: textStyleBig,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: reportFormInputIncidentType(_incidentController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: reportFormInputDate(_dateController)),
                            const SizedBox(width: 5),
                            Expanded(
                                child: reportFormInputSeverity(
                                    _severityController))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: reportFormInputLocation(_locationController),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            reportFormInputDescription(_descriptionController),
                      ),
                      cameraView(halfWidth, halfHeight),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ElevatedClickButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    sendReport();
                  }
                },
                child: 'Snap and Report',
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<void> cameraView(double halfWidth, double halfHeight) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: halfWidth,
            height: halfHeight * .5,
            child: CameraPreview(_controller!),
          );
        } else {
          return Column(
            children: [
              const Center(
                child: Loading()
              ),
              Text(
                'You must Grant Camera Permission',
                style: textStyle,
              )
            ],
          );
        }
      },
    );
  }
}

SizedBox reportFormInputIncidentType(incidentController) {
  return SizedBox(
    child: TextFormField(
      maxLines: 1,
      controller: incidentController,
      decoration: const InputDecoration(
        hintText: 'Enter type of incident',
        labelText: 'Incident type E.g Robbery, Kidnapping*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      // onSaved: (newValue) => _incident = newValue,
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
  );
}

SizedBox reportFormInputDate(dateController) {
  return SizedBox(
    child: TextFormField(
      readOnly: true,
      maxLines: 1,
      controller: dateController,
      decoration: const InputDecoration(
        hintText: 'Date of incident',
        labelText: 'DD/MM/YYYY*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      // onSaved: (newValue) => _date = newValue,
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
  );
}

SizedBox reportFormInputSeverity(severityController) {
  return SizedBox(
    child: TextFormField(
      maxLines: 1,
      controller: severityController,
      decoration: const InputDecoration(
        hintText: 'low, medium, high',
        labelText: 'severity*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      // onSaved: (newValue) => _severity = newValue,
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
  );
}

SizedBox reportFormInputLocation(locationController) {
  return SizedBox(
    child: TextFormField(
      maxLines: 1,
      controller: locationController,
      decoration: const InputDecoration(
        hintText: 'Enter type the incident location',
        labelText: 'Location*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      // onSaved: (newValue) => _location = newValue,
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
  );
}

SizedBox reportFormInputDescription(descriptionController) {
  return SizedBox(
    child: TextField(
      minLines: 6,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: descriptionController,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        hintText: 'Detailed incident description',
        labelText: 'Description*',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
    ),
  );
}
