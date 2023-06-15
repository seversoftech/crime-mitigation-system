import 'package:crime_mitigation_system/screens/notificationscreen.dart';
import 'package:crime_mitigation_system/screens/report_history.dart';
import 'package:crime_mitigation_system/screens/reportscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'screens/forgetpassword.dart';
import 'screens/loginscreen.dart';
import 'screens/profilescreen.dart';
import 'screens/signup.dart';
import 'screens/theme.dart';

//retrieve the token
Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  String? token = await getToken();
  runApp(MainApp(token: token));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  final String? token;
  const MainApp({super.key, this.token});

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
