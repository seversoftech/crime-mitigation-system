// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/constants.dart';
import '../widgets/elevatedButton.dart';
import '../widgets/loading.dart';
import '../widgets/showmessage.dart';

class ReportCrime extends StatefulWidget {
  const ReportCrime({super.key});

  @override
  State<ReportCrime> createState() => _ReportCrimeState();
}

class _ReportCrimeState extends State<ReportCrime> {
  File? _image;
  final picker = ImagePicker();

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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    } else {
      setState(() {
        _image = null;
      });
    }
  }

  Future<void> _readFromStorage() async {
    _emailController.text = await _storage.read(key: "KEY_EMAIL") ?? '';
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future sendReport() async {
    await _storage.write(key: "KEY_EMAIL", value: _emailController.text);
    await _initializeControllerFuture;

    try {
      var url = reportUrl;

      var request = http.MultipartRequest('POST', url);
      request.fields['user_email'] = _emailController.text;
      request.fields['incident'] = _incidentController.text;
      request.fields['date'] = _dateController.text;
      request.fields['severity'] = _severityController.text;
      request.fields['location'] = _locationController.text;
      request.fields['description'] = _descriptionController.text;

      var pic = await http.MultipartFile.fromPath("image", _image!.path);
      request.files.add(pic);
      var response = await request.send();

      if (response.statusCode == 200) {
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
      // var response = await http.post(
      //   url,
      //   body: {
      //     "user_email": _emailController.text,
      //     "incident": _incidentController.text,
      //     "date": _dateController.text,
      //     "severity": _severityController.text,
      //     "location": _locationController.text,
      //     "description": _descriptionController.text,
      //     "image": image.name
      //   },
      // );

      // var data = json.decode(response.body);

      // print(response.body);

      //   if (data == "Success") {
      //     ShowMessage.show(
      //       context,
      //       color: Colors.green,
      //       'Report Sent!',
      //     );
      //     Navigator.pop(context);
      //   } else {
      //     ShowMessage.show(
      //       context,
      //       color: Colors.red,
      //       'An error occured...',
      //     );
      //   }
    } catch (exception) {
      print('Exception caught: $exception');

      ShowMessage.show(
        context,
        color: Colors.red,
        'An error occurred: $exception',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: _image != null && _image!.existsSync()
                            ? Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Text(
                                  'No Image available',
                                  style: textStyleWarning,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedClickButton(
                      onPressed: () {
                        _pickImage();
                      },
                      child: 'Capture',
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: ElevatedClickButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          sendReport();
                        }
                      },
                      child: 'Send Report',
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}
