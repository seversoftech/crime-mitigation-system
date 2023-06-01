import 'package:camera/camera.dart';
import 'package:crime_mitigation_system/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';
import '../widgets/report_input_fields.dart';
import 'display_image.dart';

class ReportCrime extends StatefulWidget {
  const ReportCrime({super.key});

  @override
  State<ReportCrime> createState() => _ReportCrimeState();
}

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
              Text(
                'Fill in the required fields and click the Report button to file a report',
                style: textStyle,
              ),
              const SizedBox(
                height: 20,
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
              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the controller has finished initializing, show the camera preview
                    return CameraPreview(_controller!);
                  } else {
                    // Otherwise, display a loading indicator
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          try {
            // Ensure that the camera is initialized before taking a picture
            await _initializeControllerFuture;

            // Capture the image and retrieve the path where it's saved
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await _controller!.takePicture();
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
