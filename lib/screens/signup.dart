import 'dart:convert';

import 'package:crime_mitigation_system/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../widgets/elevatedButton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

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

  Future signup() async {
    var response = await http.post(
      Uri.parse(signupUrl),
      body: {
        "fullname": _fullnameController.text,
        "password": _passwordController.text,
        "email": _emailController.text,
        "phone": _phoneController.text,
        "address": _addressController.text
      },
    );

    var data = json.decode(response.body);
    if (data == "Error") {
      const ToastMessage(
        message: "User Exists",
        gravity: ToastGravity.BOTTOM,
        color: Colors.red,
      );
    } else {
      const ToastMessage(
        message: "Registration Successful",
        gravity: ToastGravity.BOTTOM,
        color: Colors.green,
      );
    }
  }

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
            child: Form(
              key: _formKey,
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
                  TextFormField(
                    onSaved: (newValue) => _fullname = newValue,
                    onChanged: (value) {
                      if (value.isNotEmpty) {}
                      return;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return namelNullError;
                      }
                      return null;
                    },
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
                  TextFormField(
                    onSaved: (newValue) => _email = newValue,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                      } else if (emailValidatorRegExp.hasMatch(value)) {}
                      return;
                    },
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return emailNullError;
                      } else if (!emailValidatorRegExp.hasMatch(value)) {
                        return invalidEmailError;
                      }
                      return null;
                    },
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
                  TextFormField(
                    onSaved: (newValue) => _phone = newValue,
                    onChanged: (value) {
                      if (value.isNotEmpty) {}
                      return;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return phoneNumberNullError;
                      }
                      return null;
                    },
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
                  TextFormField(
                    onSaved: (newValue) => _address = newValue,
                    onChanged: (value) {
                      if (value.isNotEmpty) {}
                      return;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return addressNullError;
                      }
                      return null;
                    },
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
                  TextFormField(
                    onSaved: (newValue) => _password = newValue,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                      } else if (value.length >= 8) {}
                      return;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return passNullError;
                      } else if (value.length < 8) {
                        return shortPassError;
                      }
                      return null;
                    },
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        signup();
                      }
                    },
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
      ),
    );
  }
}
