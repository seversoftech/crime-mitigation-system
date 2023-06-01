import 'package:camera/camera.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:crime_mitigation_system/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../main.dart';
import '../widgets/elevatedButton.dart';
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
  final _formKey = GlobalKey<FormState>();

  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _dateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
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
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
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
                                )),
                                Text(
                                  'Grant Camera Permission',
                                  style: textStyle,
                                )
                              ],
                            );
                          }
                        },
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
              child: ElevatedClickButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  // Navigator.pushNamed(context, '/profile');
                },
                child: 'Send Report',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(LineAwesomeIcons.retro_camera),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
