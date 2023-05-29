import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('User Profile'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/icons/icon.png'),
          ),
          SizedBox(height: 16),
          Text(
            'Sever Emmanuel',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Student',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('sever@seversoftech.com'),
          ),
          ListTile(
            leading: Icon(LineAwesomeIcons.home, size: 50, color: Colors.green),
            title: Text('07033409667'),
          ),
        ],
      ),
    );
  }
}
