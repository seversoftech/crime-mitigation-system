import 'package:flutter/material.dart';

class AnimatedBottomSheetExample extends StatefulWidget {
  const AnimatedBottomSheetExample({super.key});

  @override
  _AnimatedBottomSheetExampleState createState() =>
      _AnimatedBottomSheetExampleState();
}

class _AnimatedBottomSheetExampleState extends State<AnimatedBottomSheetExample> {
  bool _isBottomSheetOpen = false;

  void _openBottomSheet() {
    setState(() {
      _isBottomSheetOpen = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: _buildBottomSheetContent(),
        );
      },
    );
  }

  Widget _buildBottomSheetContent() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {
              // Handle share action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Copy Link'),
            onTap: () {
              // Handle copy link action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              // Handle delete action
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Bottom Sheet Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openBottomSheet,
          child: const Text('Open Bottom Sheet'),
        ),
      ),
    );
  }
}
