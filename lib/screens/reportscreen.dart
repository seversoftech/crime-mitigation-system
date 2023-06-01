import 'package:camera/camera.dart';
import 'package:crime_mitigation_system/constants/constants.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ReportCrime extends StatefulWidget {
  const ReportCrime({super.key});

  @override
  State<ReportCrime> createState() => _ReportCrimeState();
}

TextEditingController _incidentController = TextEditingController();
TextEditingController _dateController = TextEditingController();
TextEditingController _severityController = TextEditingController();
TextEditingController _locationController = TextEditingController();
TextEditingController _descriptionController = TextEditingController();

String? _incident;

class _ReportCrimeState extends State<ReportCrime> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Select the first available camera
    _controller = CameraController(cameras![0], ResolutionPreset.medium);

    // Initialize the controller
    _initializeControllerFuture = _controller!.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _controller!.dispose();
    super.dispose();
  }

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: reportFormInputIncidentType(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: reportFormInputDate()),
                    const SizedBox(width: 5),
                    Expanded(child: reportFormInputSeverity())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: reportFormInputLocation(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: reportFormInputDescription(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox reportFormInputIncidentType() {
    return SizedBox(
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
    );
  }

  SizedBox reportFormInputDate() {
    return SizedBox(
      height: 45,
      child: TextFormField(
        maxLines: 1,
        controller: _dateController,
        decoration: const InputDecoration(
          hintText: 'Enter type date',
          labelText: 'DD/MM/YYYY*',
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
    );
  }

  SizedBox reportFormInputSeverity() {
    return SizedBox(
      height: 45,
      child: TextFormField(
        maxLines: 1,
        controller: _severityController,
        decoration: const InputDecoration(
          hintText: 'Select how severe',
          labelText: 'severerity*',
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
    );
  }

  SizedBox reportFormInputLocation() {
    return SizedBox(
      height: 45,
      child: TextFormField(
        maxLines: 1,
        controller: _locationController,
        decoration: const InputDecoration(
          hintText: 'Enter type the incident location',
          labelText: 'Location*',
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
    );
  }

  SizedBox reportFormInputDescription() {
    return SizedBox(
      // height: 45,
      child: TextField(
        minLines: 6,
        keyboardType: TextInputType.multiline,
        maxLines: null,

        controller: _descriptionController,
        decoration: const InputDecoration(
          alignLabelWithHint: true,
          hintText: 'Detailed incident description',
          labelText: 'Description*',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
        ),
        // onSaved: (newValue) => _incident = newValue,
        // onChanged: (value) {
        //   if (value.isNotEmpty) {
        //   } else if (value.length >= 8) {}
        //   return;
        // },
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return incidentError;
        //   }
        //   return null;
        // },
      ),
    );
  }
}
