class Cars {
  String? sId;
  String? name;
  String? image;
  int? capacity;
  String? fuelType;
  int? rentPerHour;
  List<BookedTimeSlots>? bookedTimeSlots;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Cars(
      {this.sId,
      this.name,
      this.image,
      this.capacity,
      this.fuelType,
      this.rentPerHour,
      this.bookedTimeSlots,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Cars.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    capacity = json['capacity'];
    fuelType = json['fuelType'];
    rentPerHour = json['rentPerHour'];
    if (json['bookedTimeSlots'] != null) {
      bookedTimeSlots = <BookedTimeSlots>[];
      json['bookedTimeSlots'].forEach((v) {
        bookedTimeSlots!.add(BookedTimeSlots.fromJson(v));
      });
    }
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
    if (bookedTimeSlots != null) {
      data['bookedTimeSlots'] =
          bookedTimeSlots!.map((v) => v.toJson()).toList();
    }
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
