// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['_id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'gender': instance.gender,
      'address': instance.address,
    };
