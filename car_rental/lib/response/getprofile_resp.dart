import 'package:json_annotation/json_annotation.dart';
import '/model/profile.dart';

part 'getprofile_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetProfile {
  final bool success;
  
  final List<userprofile> data;

  ResponseGetProfile({
    required this.success,
    required this.data,
  });

  factory ResponseGetProfile.fromJson(Map<String, dynamic> obj) =>
      _$ResponseGetProfileFromJson(obj);

  Map<String, dynamic> toJson() => _$ResponseGetProfileToJson(this);
}
