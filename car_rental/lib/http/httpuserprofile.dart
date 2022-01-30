import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:car_rental/model/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '/http/httpuser.dart';


class HttpConnectProfile {
  final baseurl = 'http://10.0.2.2:4000/api/users/';
  String mytoken = HttpConnectUser.token;

  Future<String> uploadImage(String filepath, String id) async {
    try {
      String route = 'profile/' + id + '/photo';
      String url = baseurl + route;
      var request = http.MultipartRequest('PUT', Uri.parse(url));
      //using the token in the headers
      request.headers.addAll({
        'Authorization': 'Bearer $mytoken',
      });
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

  void registerprofilePosts(Profile profile, File? file) async {
    String s = '';
    Map<String, dynamic> profileMap = {
      'fullname': profile.fullname,
      'email': profile.email,
      'gender': profile.gender,
      'address': profile.address,
    };
    String tok = 'Bearer $mytoken';
    try {
      final response = await http
          .post(Uri.parse(baseurl + 'profile/'), body: profileMap, headers: {
        'Authorization': tok,
      });

      if (response.statusCode == 201) {
        //uploading image after data inserted of profile
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

  Future<List<Profile>> getProfiles() async {
    String tok = 'Bearer $mytoken';
    final response = await http.get(Uri.parse(baseurl + "profile/"), headers: {
      'Authorization': tok,
    });
    if (response.statusCode == 200) {
      var a = ResponseGetProfile.fromJson(jsonDecode(response.body));
      return a.data;
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
