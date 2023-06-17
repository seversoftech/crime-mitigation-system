import 'package:crime_mitigation_system/screens/notificationscreen.dart';
import 'package:crime_mitigation_system/screens/report_history.dart';
import 'package:crime_mitigation_system/screens/reportscreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'screens/forgetpassword.dart';
import 'screens/loginscreen.dart';
import 'screens/profilescreen.dart';
import 'screens/signup.dart';
import 'screens/theme.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

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
        '/notifications': (context) => const NotificationScreen(),
        '/report': (context) => const ReportCrime(),
        '/history': (context) => const History(),
      },
    );
  }
}
