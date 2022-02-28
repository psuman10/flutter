import 'package:car_rental/dao/cardao.dart';
import 'package:car_rental/entity/load.dart';
import 'package:floor/floor.dart';

//Need import
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; //generate code

@Database(version: 1, entities: [LoadCar])
abstract class AppDatabase extends FloorDatabase {
  CarDAO get carDAO;
}
