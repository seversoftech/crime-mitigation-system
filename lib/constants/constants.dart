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
final RegExp phoneValidatorRegExp = RegExp(r'^[0][7-9][0-1]\d{8}$');
const String namelNullError = "Please Enter your full name";
const String phoneNumberNullError = "Please Enter a valid phone number";
const String shortPhoneError = "Phone number must be 11 digit";
const String addressNullError = "Please Enter your address";
const String incidentError = "Field is required";
const String noError = " ";

//

//
var baseUrl = "http://192.168.139.214/crimemitigation";

var loginUrl = Uri.parse("$baseUrl/login.php");
var signupUrl = Uri.parse("$baseUrl/register.php");
var reportUrl = Uri.parse("$baseUrl/report.php");
var historyUrl = Uri.parse("$baseUrl/report_history.php?user_email=");
var forgetpassUrl = Uri.parse("$baseUrl/forgetpass.php");
var notificationUrl = Uri.parse("$baseUrl/notification.php");
var checkloginUrl = Uri.parse("$baseUrl/checkLogin.php");
var logoutUrl = Uri.parse("$baseUrl/logout.php");
