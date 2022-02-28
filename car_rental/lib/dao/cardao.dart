import 'package:car_rental/entity/load.dart';
import 'package:floor/floor.dart';

@dao
abstract class CarDAO {
  @Query('SELECT * FROM CAR WHERE sid=:sid')
  Stream<List<LoadCar>> getAllItemInCarBySid(String sid);

  @Query('SELECT * FROM CAR WHERE sid=:sid AND id=:id')
  Stream<List<LoadCar>> getItemInCarBySid(String sid, String id);

  @Query('DELETE FROM CAR where uid=:uid')
  Stream<List<LoadCar>> clearCarBySid(String sid);

  @insert
  Future<void> insertCar(LoadCar DisplayCar);

  @update
  Future<void> updateCar(LoadCar DisplayCar);

  @delete
  Future<void> deleteCar(LoadCar DisplayCar);

}
