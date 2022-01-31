// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getprofile_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetProfile _$ResponseGetProfileFromJson(Map<String, dynamic> json) =>
    ResponseGetProfile(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetProfileToJson(ResponseGetProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
