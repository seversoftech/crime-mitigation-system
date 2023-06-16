// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/constants.dart';
import '../widgets/profilemenu.dart';
import '../widgets/textButton.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _storage = const FlutterSecureStorage();
  String? storedValue;

  Future<void> getValueFromStorage() async {
    final value = await _storage.read(key: 'KEY_EMAIL');
    setState(() {
      storedValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    getValueFromStorage();
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
            Text(storedValue ?? '', style: textStyleBold),
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
                _showSimpleDialog(context);
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
}

void _showSimpleDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      var halfHeight = MediaQuery.of(context).size.height * 0.1;

      return AlertDialog(
        icon: const Icon(
          LineAwesomeIcons.info_circle,
          color: Colors.deepPurple,
          size: 40,
        ),
        titleTextStyle: textStyleWarning,
        title: const Text(
            textAlign: TextAlign.center,
            'Design and Implementation of mobile app to mitigate insurgency in Nigeria'),
        content: SizedBox(
          height: halfHeight,
          child: Column(
            children: [
              Text('Full Name:  Name goes here', style: textStyle),
              Text('Department of Computer Science', style: textStyle),
              Text('Supervised by Mr. Name goes here', style: textStyle),
              Text('Verified by Mr. Name goes here', style: textStyle),
            ],
          ),
        ),
        actions: [
          TextClickButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Close...',
          )
        ],
      );
    },
  );
}
