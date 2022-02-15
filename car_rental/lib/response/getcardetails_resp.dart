import 'package:json_annotation/json_annotation.dart';
import '../model/car_model.dart';

part 'getcardetails_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetCarsById {
  final bool success;

  final List<Cars> car;

  ResponseGetCarsById({
    required this.success,
    required this.car,
  });

  factory ResponseGetCarsById.fromJson(Map<String, dynamic> obj) =>
      _$ResponseGetCarsByIdFromJson(obj);

  Map<String, dynamic> toJson() => _$ResponseGetCarsByIdToJson(this);
}
