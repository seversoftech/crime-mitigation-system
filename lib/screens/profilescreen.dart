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
                  CircleAvatar(
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
                          icon: (Icon(
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
              press: () {},
              text: 'Report Crime',
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.history,
              press: () { Navigator.pushNamed(context, '/report');},
              text: 'Report History',
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.bell,
              press: () { Navigator.pushNamed(context, '/notifications');},
              text: 'Notification',
            ),
            ProfileMenu(
              icon: LineAwesomeIcons.address_card,
              press: () {},
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
}
