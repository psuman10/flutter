import 'package:json_annotation/json_annotation.dart';
import '../model/car_model.dart';

part 'getcars_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetCars {
  final bool success;

  final List<Cars> cars;

  ResponseGetCars({
    required this.success,
    required this.cars,
  });

  factory ResponseGetCars.fromJson(Map<String, dynamic> obj) =>
      _$ResponseGetCarsFromJson(obj);

  Map<String, dynamic> toJson() => _$ResponseGetCarsToJson(this);
}
