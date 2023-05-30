import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.white, elevation: 0),
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
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
