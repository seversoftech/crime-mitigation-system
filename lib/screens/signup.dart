import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants/constants.dart';
import '../widgets/elevatedButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _fullname;
  String? _email;
  String? _phone;
  String? _address;
  String? _password;

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                Text(
                  'Create Account',
                  style: textStyleBig,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Fill in the required details ',
                  style: textStyle,
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _fullnameController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(LineAwesomeIcons.user_circle),
                    hintText: 'Enter your full name',
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(LineAwesomeIcons.envelope),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(LineAwesomeIcons.phone),
                    hintText: 'Enter your Phone number',
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(LineAwesomeIcons.home),
                    hintText: 'Enter your resident address',
                    labelText: 'Address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(LineAwesomeIcons.lock),
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedClickButton(
                  onPressed: () {},
                  child: 'Register',
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Kindly confirm all details. By Continuing, you agree with our Terms and Conditions',
                  style: textStyle,
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
