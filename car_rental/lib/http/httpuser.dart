import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/model/user.dart';

class HttpConnectUser {
  // String baseurl = 'http://10.0.2.2:4000/api/users/';
  // String baseurl = 'http://127.0.0.1:/api/users/';
  String baseurl = 'http://192.168.101.3:4000/api/users/';
  static String token = '';

  //sending data to the server--- creating user
  Future<bool> registerPost(User user) async {
    Map<String, dynamic> userMap = {
      "username": user.username,
      "email": user.email,
      "gender": user.gender,
      "password": user.password,
    };

    final response =
        await post(Uri.parse(baseurl + '/register'), body: userMap);
    if (response.statusCode == 200) {
      jsonDecode(response.body);
      return true;
    } else {
      return false;
    }
  }

  //sending data to the server- login as user
  Future<bool> loginPosts(String username, String password) async {
    Map<String, dynamic> loginuser = {
      'username': username,
      'password': password
    };

    try {
      final response = await post(
          Uri.parse(
            baseurl + "/login",
          ),
          body: loginuser);

      //json serializing inline
      final jsonData = jsonDecode(response.body) as Map;
      var userid = jsonData['user']['_id'];
      final SharedPreferences sharedpreferences =
          await SharedPreferences.getInstance();
      sharedpreferences.setString('userid', userid);
      if (jsonData['success']) {
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
