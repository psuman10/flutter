// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:car_rental/response/getcardetails_resp.dart';
import 'package:car_rental/response/getcars_resp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '/http/httpuser.dart';
import '../model/car_model.dart';

class HttpConnectCar {
  final baseurl = 'http://10.0.2.2:4000/api/cars/';
  // String baseurl = 'http://192.168.101.3:4000/api/cars/';

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

  void registerProductPosts(Cars product, File? file) async {
    String s = '';
    Map<String, dynamic> studentMap = {
      'name': product.name,
      'image': product.image,
      'capacity': product.capacity,
      'fuelType': product.fuelType,
      'rentPerHour': product.rentPerHour,
    };

    try {
      final response = await http.post(
        Uri.parse(baseurl + 'getallcars/'),
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

  Future<List<Cars>> getCars() async {
    final response = await http.get(Uri.parse(baseurl + "getallcars/"));
    if (response.statusCode == 200) {
      var a = ResponseGetCars.fromJson(jsonDecode(response.body));
      return a.cars;
    } else {
      throw Exception('Failed to load Cars');
    }
  }
  Future<List<Cars>> getCarById(String carid) async {
    final response = await http.get(Uri.parse(baseurl + "/getcar/:carid/"));
    if (response.statusCode == 200) {
      var a = ResponseGetCarsById.fromJson(jsonDecode(response.body));
      return a.car;
    } else {
      throw Exception('Failed to load Cars');
    }
  }

  registerCar() {}
}
