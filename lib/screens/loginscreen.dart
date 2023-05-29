import 'package:flutter/material.dart';

import '../widgets/button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const FlutterLogo(
              size: 100.0,
            ),
            const SizedBox(height: 20.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
             ClickButton(gradient: const RadialGradient(
          colors: [Color(0xffffeb3b), Color(0xff673ab7)],
          stops: [0, 1],
          center: Alignment.bottomRight,
        )
        ,
            onPressed: () {},
            child: const Text('Login'),),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}


