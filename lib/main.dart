import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'screens/forgetpassword.dart';
import 'screens/loginscreen.dart';
import 'screens/profilescreen.dart';
import 'screens/signup.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgetpassword': (context) => const ForgetPassword(),
        '/profile': (context) => const UserProfilePage(),
      },
    );
  }
}
