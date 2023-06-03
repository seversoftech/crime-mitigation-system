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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10),
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
                aboutDialogue(context);
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

  Widget aboutDialogue(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            '',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            '',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
