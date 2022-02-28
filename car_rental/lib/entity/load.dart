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
      this.createdAt,
      this.updatedAt,
      this.iV});
}
