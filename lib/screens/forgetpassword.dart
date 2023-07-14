// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../constants/constants.dart';
import '../widgets/elevatedButton.dart';
import '../widgets/loading.dart';
import '../widgets/showmessage.dart';
import '../widgets/textButton.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> resetPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Future.delayed(const Duration(seconds: 2));

      ShowMessage.show(
        context,
        color: Colors.green,
        'Password reset link sent!',
      );
    } catch (e) {
      ShowMessage.show(
        context,
        color: Colors.red,
        'An error occurred: $e',
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
            child: Form(
              key: _formKey,
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
                    'Please enter your email, we will send you a password reset link...',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
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
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await resetPassword();
                            }
                          },
                    child: Ink(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 200.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: _isLoading
                            ? const Loading()
                            : Text(
                                'Continue',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: textStyle,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextClickButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signup');
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
