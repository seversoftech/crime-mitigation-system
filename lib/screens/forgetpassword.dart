import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants/constants.dart';
import '../widgets/elevatedButton.dart';
import '../widgets/textButton.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/icons/icon.png',
                  height: 120,
                ),
                const SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter your email, we will send you a password reset link...',
                  style: textStyle,
                ),
                const SizedBox(height: 20.0),
                TextField(
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
                ElevatedClickButton(
                  onPressed: () {},
                  child: 'Continue',
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
