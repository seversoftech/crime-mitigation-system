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
bool validatePhoneNumber(String phoneNumber) {
  String digitsOnly = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

  return digitsOnly.length == 11;
}

const String noError = " ";

//192.168.139.214
var baseUrl = "http://192.168.139.214";

var loginUrl = Uri.parse("$baseUrl/crimemitigation/login.php");
var signupUrl = Uri.parse("$baseUrl/crimemitigation/register.php");
var reportUrl = Uri.parse("$baseUrl/crimemitigation/report.php");
var historyUrl = Uri.parse("$baseUrl/crimemitigation/history.php");
var forgetpassUrl = Uri.parse("$baseUrl/crimemitigation/forgetpass.php");
var notificationUrl = Uri.parse("$baseUrl/crimemitigation/notification.php");
var checkloginUrl = Uri.parse("$baseUrl/crimemitigation/checkLogin.php");
var logoutUrl = Uri.parse("$baseUrl/crimemitigation/logout.php");
