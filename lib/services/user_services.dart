import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/userModel.dart';

class UserService {
  // var addUrl = Uri.parse("http://192.168.0.101/del/server/add.php");
  // var viewUrl = Uri.parse("http://192.168.0.101/del/server/view.php");
  // var updateUrl = Uri.parse("http://192.168.0.101/del/server/update.php");
  // var deleteUrl = Uri.parse("http://192.168.0.101/del/server/delete.php");

  var loginUrl = Uri.parse("http://192.168.15.214/crimemitigation/login.php");
  var signupUrl =
      Uri.parse("http://192.168.15.214/crimemitigation/register.php");
  var reportUrl = Uri.parse("http://192.168.15.214/crimemitigation/report.php");
  var historyUrl =
      Uri.parse("http://192.168.15.214/crimemitigation/history.php");
  var forgetpassUrl =
      Uri.parse("http://192.168.15.214/crimemitigation/forgetpass.php");
  var notificationUrl =
      Uri.parse("http://192.168.15.214/crimemitigation/notification.php");

  Future<String> registerUser(UserModel userModel) async {
    final response =
        await http.post(signupUrl, body: userModel.toJsonRegister());
    if (response.statusCode == 200) {
      // var data = json.decode(response.body);
     
      return response.body;
    } else {
      return "Error";
    }
  }

  // List<UserModel> userFromJson(String jsonString) {
  //   final data = json.decode(jsonString);
  //   return List<UserModel>.from(data.map((item) => UserModel.fromJson(item)));
  // }

  // Future<List<UserModel>> getUser() async {
  //   final response = await http.get(viewUrl);
  //   if (response.statusCode == 200) {
  //     List<UserModel> list = userFromJson(response.body);
  //     return list;
  //   } else {
  //     return <UserModel>[];
  //   }
  // }

  // Future<String> updateUser(UserModel userModel) async {
  //   final response = await http.post(updateUrl, body: userModel.toJsonUpdate());
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }

  // Future<String> deleteUser(UserModel userModel) async {
  //   final response = await http.post(updateUrl, body: userModel.toJsonUpdate());
  //   if (response.statusCode == 200) {
  //     return response.body;
  //   } else {
  //     return "Error";
  //   }
  // }
}
