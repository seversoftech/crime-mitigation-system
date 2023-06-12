// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//save token
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future login() async {
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
      // if (kDebugMode) {
      //   print(response.body);
      // }
      // int token = data['token'];
      // await saveToken(token.toString());

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
      return false;
    }
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
