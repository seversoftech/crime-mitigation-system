import 'package:crime_mitigation_system/screens/reportscreen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'screens/forgetpassword.dart';
import 'screens/loginscreen.dart';
import 'screens/profilescreen.dart';
import 'screens/signup.dart';
import 'screens/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final storage = const FlutterSecureStorage();

  Future<String?> getEmailFromStorage() async {
    return await storage.read(key: "KEY_EMAIL");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getEmailFromStorage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          const MaterialApp(home: LoginScreen());
        }

        final storedEmail = snapshot.data;

        return MaterialApp(
          theme: themeData(),
          debugShowCheckedModeBanner: false,
          initialRoute: storedEmail != null ? '/profile' : '/home',
          routes: {
            '/home': (context) => const LoginScreen(),
            '/signup': (context) => const SignupScreen(),
            '/forgetpassword': (context) => const ForgetPassword(),
            '/profile': (context) => const UserProfilePage(),
            '/report': (context) => const ReportCrime(),
          },
        );
      },
    );
  }
}
