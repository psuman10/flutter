import 'package:floor/floor.dart';

@entity
class DisplayCar {
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

  DisplayCar(
      {this.sId,
      this.name,
      this.image,
      this.capacity,
      this.fuelType,
      this.rentPerHour,
      this.createdAt,
      this.updatedAt,
      this.iV});

  DisplayCar.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    capacity = json['capacity'];
    fuelType = json['fuelType'];
    rentPerHour = json['rentPerHour'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['capacity'] = capacity;
    data['fuelType'] = fuelType;
    data['rentPerHour'] = rentPerHour;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class BookedTimeSlots {
  String? from;
  String? to;
  String? sId;

  BookedTimeSlots({this.from, this.to, this.sId});

  BookedTimeSlots.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['from'] = from;
    data['to'] = to;
    data['_id'] = sId;
    return data;
  }
}
