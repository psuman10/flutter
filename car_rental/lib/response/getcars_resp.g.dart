// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getcars_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetCars _$ResponseGetCarsFromJson(Map<String, dynamic> json) =>
    ResponseGetCars(
      success: json['success'] as bool,
      cars: (json['cars'] as List<dynamic>)
          .map((e) => Cars.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetCarsToJson(ResponseGetCars instance) =>
    <String, dynamic>{
      'success': instance.success,
      'cars': instance.cars.map((e) => e.toJson()).toList(),
    };
