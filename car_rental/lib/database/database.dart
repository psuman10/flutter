import 'dart:async';
import 'dart:convert';
import 'package:car_rental/dao/cardao.dart';
import 'package:car_rental/screen/login.dart';
import 'package:car_rental/sqlmodel/car.dart';
import 'package:car_rental/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:connectivity_plus/connectivity_plus.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [
  DisplayCar,
])
abstract class AppDatabase extends FloorDatabase {
  CarDAO get carDao;
}

class DatabaseService {
  String? token = "";
  late AppDatabase database;

  DatabaseService() {
    initDatabase();
    getToken();
  }

  initDatabase() async {
    database = await $FloorAppDatabase
        .databaseBuilder('car_rental_database.db')
        .build();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<List<DisplayCar>> getCars(BuildContext context) async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    await initDatabase();
    final carDao = database.carDao;

    if (result == ConnectivityResult.none) {
      const snackBar = SnackBar(
          content: Text('Fetching Local Data...',
              style: TextStyle(color: Colors.yellow),
              textAlign: TextAlign.center));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      final result = await carDao.findAllCars();
      return result;
    }

    final response = await http.get(
      Uri.parse(BASE_URL + 'addDisplayCar/showall'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body)["data"];
      carDao.deleteAllCars();
      List<DisplayCar> flight = body.map(
        (dynamic item) {
          DisplayCar data = DisplayCar.fromJson(item);
          carDao.insertCar(data);
          return data;
        },
      ).toList();

      return flight;
    } else if (response.statusCode == 401) {
      setToken("");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
      return Future<List<DisplayCar>>.value([]);
    } else {
      throw Exception('Failed to load flights');
    }
  }
}
