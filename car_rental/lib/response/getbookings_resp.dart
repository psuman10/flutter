import 'package:car_rental/model/bookingnewcar_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'getbookings_resp.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseGetBookings {

  final List<BookingNewCar> bookings;

  ResponseGetBookings({
    required this.bookings,
  });

  factory ResponseGetBookings.fromJson(Map<String, dynamic> obj) =>
      _$ResponseGetBookingsFromJson(obj);

  Map<String, dynamic> toJson() => _$ResponseGetBookingsToJson(this);
}
