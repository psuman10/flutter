class BookingNewCar {
  String? totalAmount;
  String? totalHours;
  String? car;
  String? user;
  String? transactionId;
  String? start;
  String? end;


  BookingNewCar(
      {this.totalAmount,
      this.totalHours,
      this.car,
      this.user,
      this.transactionId,
      this.start,
      this.end
      });

  BookingNewCar.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    totalHours = json['rentPerHour'];

    car = json['car'];
    user = json['user'];
    
    transactionId = json['transactionId'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalAmount'] = totalAmount;
    data['totalHours'] = totalHours;
    data['car'] = car;
    data['user'] = user;
    data['transactionId'] = transactionId;
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}
