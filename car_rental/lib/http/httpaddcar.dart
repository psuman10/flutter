import 'dart:convert';
import 'package:car_rental/model/addcar_model.dart';
import 'package:http/http.dart';

class HttpCar {
  String baseurl = 'http://10.0.2.2:4000/api/cars/';

  //sending data to the server--- creating user
  Future<bool> registerCar(Car car) async {
    Map<String, dynamic> userMap = {
      "name": car.name,
      "image": car.image,
      "capacity": car.capacity,
      "fuelType": car.fuelType,
      "rentPerHour": car.rentPerHour,
    };

    final response = await post(Uri.parse(baseurl + '/addcar'), body: userMap);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
