import 'package:flutter/material.dart';

//

TextStyle textStyle =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 16);
TextStyle textStyleBold =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

TextStyle textStyleWarning = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red);
TextStyle textStyleBig =
    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25);

//

//
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please Enter your email";
const String invalidEmailError = "Please Enter Valid Email";
const String passNullError = "Please Enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String namelNullError = "Please Enter your full name";
const String phoneNumberNullError = "Please Enter your phone number";
const String addressNullError = "Please Enter your address";
const String incidentError = "Field is required";
const String noError = " ";

//

var baseUrl = "http://192.168.15.214/crimemitigation";

var loginUrl = "$baseUrl/login.php";
var signupUrl = "$baseUrl/register.php";
var reportUrl = "$baseUrl/report.php";
var historyUrl = "$baseUrl/history.php";
var forgetpassUrl = "$baseUrl/forgetpass.php";
var notificationUrl = "$baseUrl/notification.php";
