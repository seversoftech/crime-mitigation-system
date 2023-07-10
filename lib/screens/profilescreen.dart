import 'package:crime_mitigation_system/screens/notificationscreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/constants.dart';
import '../widgets/profilemenu.dart';
import '../widgets/textButton.dart';
import 'report_history.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _storage = const FlutterSecureStorage();
  String? storedEmail;
  String? storedPass;

  Future<void> getValueFromStorage() async {
    final email = await _storage.read(key: 'KEY_EMAIL');
    final password = await _storage.read(key: 'KEY_PASSWORD');
    setState(() {
      storedEmail = email;
      storedPass = password;
    });
  }

  void logOut() async {
    await _storage.delete(key: 'KEY_EMAIL');
    await _storage.delete(key: 'KEY_PASSWORD');
    setState(() {
      storedEmail = '';
      storedPass = '';
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
      body: SingleChildScrollView(
        child: Center(
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
              Text(storedEmail ?? '', style: textStyleBold),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportHistroy(
                        userEmail: storedEmail!,
                      ),
                    ),
                  );
                },
                text: 'Report History',
              ),
              ProfileMenu(
                icon: LineAwesomeIcons.bell,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(
                        userEmail: storedEmail!,
                      ),
                    ),
                  );
                },
                text: 'Notification',
              ),
              ProfileMenu(
                icon: LineAwesomeIcons.address_card,
                press: () {
                  _showAboutDialog(context);
                },
                text: 'About',
              ),
              ProfileMenu(
                icon: LineAwesomeIcons.alternate_sign_out,
                press: () {
                  logOut();
                  Navigator.pushReplacementNamed(context, '/home');
                },
                text: 'Log Out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showAboutDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      var height = MediaQuery.of(context).size.width / 3;

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
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full Name:  Name goes here', style: textStyle),
              Text('Department of Computer Science', style: textStyle),
              Text('Supervisor: Mr. Name goes here', style: textStyle),
              Text('Verifier Mr. Name goes here', style: textStyle),
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
