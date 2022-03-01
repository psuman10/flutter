// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:car_rental/model/profile.dart';
import 'package:car_rental/response/getprofile_resp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HttpConnectprofile {
  // final baseurl = 'http://10.0.2.2:4000/api/cars/';
  static String baseurl = 'http://192.168.101.3:4000/api/users/';

  Future<String> uploadImage(String filepath, String id) async {
    try {
      String route = 'student/' + id + '/photo';
      String url = baseurl + route;
      var request = http.MultipartRequest('PUT', Uri.parse(url));
      //using the token in the headers
      // need a filename

      var ss = filepath.split('/').last;
      // adding the file in the request
      request.files.add(
        http.MultipartFile(
          'file',
          File(filepath).readAsBytes().asStream(),
          File(filepath).lengthSync(),
          filename: ss,
        ),
      );

      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return 'ok';
      }
    } catch (err) {
      log('$err');
    }
    return 'something goes wrong';
  }

  void registerProductPosts(userprofile profile, File? file) async {
    String s = '';
    Map<String, dynamic> studentMap = {
      'fullname': profile.username,
      'email': profile.email,
      'gender': profile.gender,
      'address': profile.address
    };

    try {
      final response = await http.post(
        Uri.parse(baseurl + 'profile/'),
        body: studentMap,
      );

      if (response.statusCode == 201) {
        //uploading image after data inserted of student
        if (file != null) {
          var jsonData = jsonDecode(response.body);
          s = await uploadImage(file.path, jsonData['data']['_id']);
        }
        if (s == 'ok') {
          Fluttertoast.showToast(msg: "Data uploaded successfully");
        }
      }
    } catch (err) {
      log('$err');
    }
  }

  // Future<List<userprofilee>> getprofile() async {
  //   final response = await http.get(Uri.parse(baseurl + "profile/"));
  //   if (response.statusCode == 200) {
  //     var a = ResponseGetProfile.fromJson(jsonDecode(response.body));
  //     return a.data;
  //   } else {
  //     throw Exception('Failed to load Cars');
  //   }
  // }

  static Future<userprofile> getUserById(String id) async {
    final response = await http.get(Uri.parse(baseurl + "/getallusers/" + id));

print(response.body);
    if (response.statusCode == 200) {
      var a = jsonDecode(response.body);
   
      return a.data;
    } else {
      throw Exception('Failed to load Users');
    }
  }

  registerCar() {}
}
