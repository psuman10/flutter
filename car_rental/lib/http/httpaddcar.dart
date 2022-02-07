import 'dart:convert';
import 'package:car_rental/model/addcar_model.dart';
import 'package:http/http.dart';

class HttpCar {
  String baseurl = 'http://10.0.2.2:4000/api/cars/';
  static String token = '';

  //sending data to the server--- creating user
  Future<bool> registerCar(Car user) async {
    Map<String, dynamic> userMap = {
      "name": user.name,
      "image": user.image,
      "capacity": user.capacity,
      "fuelType": user.fuelType,
      "rentPerHour": user.rentPerHour,
    };

    final response = await post(Uri.parse(baseurl + '/addcar'), body: userMap);
    if (response.statusCode == 200) {
      
      jsonDecode(response.body);
      return true;
    } else {
      return false;
    }
  }
}
