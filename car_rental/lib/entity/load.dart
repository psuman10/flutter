import 'package:car_rental/sqlmodel/car.dart';
import 'package:floor/floor.dart';

@entity
class LoadCar {
  @primaryKey
  String? sId;
  String? name;
  String? image;
  int? capacity;
  String? fuelType;
  int? rentPerHour;
  List<BookedTimeSlots>? bookedTimeSlots;
  String? createdAt;
  String? updatedAt;
  int? iV;

  LoadCar(
      {this.sId,
      this.name,
      this.image,
      this.capacity,
      this.fuelType,
      this.rentPerHour,
      this.bookedTimeSlots,
      this.createdAt,
      this.updatedAt,
      this.iV});
}
