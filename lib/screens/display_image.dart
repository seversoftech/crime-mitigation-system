import 'dart:io';

import 'package:flutter/material.dart';

class DisplayImageScreen extends StatelessWidget {
  final String imagePath;

  const DisplayImageScreen({required Key key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captured Image'),
      ),
      body: Image.file(File(imagePath)),
    );
  }
}
