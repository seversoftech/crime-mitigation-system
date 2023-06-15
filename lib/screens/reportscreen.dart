import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/constants.dart';
import '../main.dart';
import '../widgets/elevatedButton.dart';
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

  final TextEditingController _incidentController = TextEditingController();
  final TextEditingController _severityController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd HH:mm:ss').format(
      DateTime.now(),
    ),
  );

  @override
  void initState() {
    super.initState();

    _controller = CameraController(cameras![0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller!.initialize();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Future sendReport() async {
    await _initializeControllerFuture;

    final image = await _controller!.takePicture();
    var url = reportUrl;
    var response = await http.post(
      url,
      body: {
        "incident": _incidentController.text,
        "date": _dateController.text,
        "severity": _severityController.text,
        "location": _locationController.text,
        "description": _descriptionController.text,
        "image": image.path,
      },
    );

    var data = json.decode(response.body);
    if (kDebugMode) {
      print(response.body);
    }

    // if (data == "Success") {
    //   ShowMessage.show(
    //     context,
    //     color: Colors.green,
    //     'Report Sent!',
    //   );
    // } else {
    //   ShowMessage.show(
    //     context,
    //     color: Colors.red,
    //     'An error occured...',
    //   );
    // }
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
                  // Navigator.pushNamed(context, '/profile');
                },
                child: 'Snap and Report',
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: takePicture,
      //   child: const Icon(LineAwesomeIcons.retro_camera),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  takePicture() async {
    try {
      await _initializeControllerFuture;

      // final path = join(
      //   (await getTemporaryDirectory()).path,
      //   '${DateTime.now()}.png',
      // );
      // final image = await _controller!.takePicture();
      // await _controller!.takePicture();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
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
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.square,
                  strokeWidth: 2,
                ),
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
