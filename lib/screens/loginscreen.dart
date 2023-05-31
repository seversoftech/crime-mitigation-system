import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../widgets/elevatedButton.dart';
import '../widgets/textButton.dart';
import '../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isChecked = false;

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
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
                  height: 120,
                ),
                Text('WELCOME BACK', style: textStyleBig),
                Text(
                  textAlign: TextAlign.center,
                  'Sign in with your registered email address and password to continue...',
                  style: textStyle,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(LineAwesomeIcons.envelope),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(LineAwesomeIcons.lock),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(
                              () {
                                isChecked = value!;
                              },
                            );
                          },
                        ),
                        Text(
                          'Remember Me',
                          style: textStyle,
                        ),
                      ],
                    ),
                    TextClickButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgetpassword');
                      },
                      text: 'Forget Password',
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                ElevatedClickButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: 'Login',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: textStyle,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextClickButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      text: 'Sign Up',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
