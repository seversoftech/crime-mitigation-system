// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import '../widgets/elevatedButton.dart';
import '../widgets/showmessage.dart';
import '../widgets/textButton.dart';
import '../constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();

  final _storage = const FlutterSecureStorage();

  final TextEditingController _emailController =
      TextEditingController(text: "");
  final TextEditingController _passwordController =
      TextEditingController(text: "");

  Future<void> _readFromStorage() async {
    _emailController.text = await _storage.read(key: "KEY_EMAIL") ?? '';
    _passwordController.text = await _storage.read(key: "KEY_PASSWORD") ?? '';
  }

//save token

  Future login() async {
    await _storage.write(key: "KEY_EMAIL", value: _emailController.text);
    await _storage.write(key: "KEY_PASSWORD", value: _passwordController.text);

    var url = loginUrl;

    var response = await http.post(
      url,
      body: {
        "email": _emailController.text,
        "password": _passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (kDebugMode) {
        print(response.body);
      }

      if (data == "Success") {
        ShowMessage.show(
          context,
          color: Colors.green,
          'Successful Login',
        );
        Navigator.pushNamed(context, '/profile');
      } else {
        ShowMessage.show(
          context,
          color: Colors.red,
          'Incorrect Login details!',
        );
      }
      return true;
    } else {
      ShowMessage.show(
        context,
        color: Colors.red,
        'Connection Problem...',
      );
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _readFromStorage();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
                  Text('WELCOME BACK', style: textStyleBig),
                  Text(
                    textAlign: TextAlign.center,
                    'Sign in with your registered email address and password to continue...',
                    style: textStyle,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    // onSaved: (newValue) => _email = newValue,
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
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    // onSaved: (newValue) => _password = newValue,
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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        login();
                      }
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
      ),
    );
  }
}
