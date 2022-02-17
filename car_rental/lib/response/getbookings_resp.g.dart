// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getbookings_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseGetBookings _$ResponseGetBookingsFromJson(Map<String, dynamic> json) =>
    ResponseGetBookings(
      bookings: (json['bookings'] as List<dynamic>)
          .map((e) => BookingNewCar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseGetBookingsToJson(
        ResponseGetBookings instance) =>
    <String, dynamic>{
      'bookings': instance.bookings.map((e) => e.toJson()).toList(),
    };
