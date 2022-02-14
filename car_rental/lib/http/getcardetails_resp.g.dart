// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getcardetails_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetCarsById _$ResponseGetCarsByIdFromJson(Map<String, dynamic> json) =>
    ResponseGetCarsById(
      success: json['success'] as bool,
      car: (json['car'] as List<dynamic>)
          .map((e) => Cars.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetCarsByIdToJson(
        ResponseGetCarsById instance) =>
    <String, dynamic>{
      'success': instance.success,
      'car': instance.car.map((e) => e.toJson()).toList(),
    };
