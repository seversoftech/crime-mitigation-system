import 'package:flutter/material.dart';

import '../widgets/elevatedButton.dart';
import '../widgets/textButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/icon.png',
                  height: 150,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 10.0),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextClickButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgetpassword');
                      },
                      text: 'Forget Password',
                    ),
                    TextClickButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      text: 'Sign Up',
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedClickButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: 
                    'Login',
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
