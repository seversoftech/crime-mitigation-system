// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../widgets/profilemenu.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 115,
              width: 115,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                fit: StackFit.expand,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/icon.png"),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () {},
                          icon: (const Icon(
                            LineAwesomeIcons.camera,
                          )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.eye,
              press: () {
                Navigator.pushNamed(context, '/report');
              },
              text: 'Report Crime',
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.history,
              press: () {
                Navigator.pushNamed(context, '/history');
              },
              text: 'Report History',
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.bell,
              press: () {
                Navigator.pushNamed(context, '/notifications');
              },
              text: 'Notification',
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.address_card,
              press: () {
                _openBottomSheet;
              },
              text: 'About',
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.alternate_sign_out,
              press: () {
                Navigator.pushNamed(context, '/');
              },
              text: 'Log Out',
            ),
          ],
        ),
      ),
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

}

