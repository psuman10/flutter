import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: '_id')
  String? id;
  String? fullname;
  String? email;
  String? gender;
  String? address;

  Profile(
      {this.id,
      this.fullname,
      this.email,
      this.gender,
      this.address,});

  factory Profile.fromJson(Map<String, dynamic> obj) => _$ProfileFromJson(obj);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
