import 'package:car_rental/sqlmodel/car.dart';
import 'package:floor/floor.dart';

@dao
abstract class CarDAO {
  @Query('SELECT * FROM Car')
  Future<List<DisplayCar>> findAllCars();

  @Query('SELECT * FROM Car WHERE id = :id')
  Stream<DisplayCar?> findCarById(int id);

  @Query('Delete from Car')
  Stream<DisplayCar?> deleteAllCars();

  @insert
  Future<void> insertCar(DisplayCar flight);
}