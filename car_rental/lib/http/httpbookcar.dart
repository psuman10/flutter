import 'dart:convert';
import 'package:car_rental/model/bookingnewcar_model.dart';
import 'package:car_rental/response/getbookings_resp.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpConnectBooking {
  String baseurl = 'http://10.0.2.2:4000/api/bookings/';
  static String token = '';

  //sending data to the server--- creating user
  Future<bool> registerCar(BookingNewCar book) async {
    Map<String, dynamic> bookMap = {
      "car": book.car,
      "user": book.user,
      "start": book.start,
      "end": book.end,
      "totalHours": book.totalHours,
      "totalAmount": book.totalAmount,
    };

    final response =
        await post(Uri.parse(baseurl + '/bookingcar'), body: bookMap);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<BookingNewCar>> getBookingNewCar() async {
    final response = await http.get(Uri.parse(baseurl + "getallbookings/"));
    if (response.statusCode == 200) {
      var a = ResponseGetBookings.fromJson(jsonDecode(response.body));

      return a.bookings;
    } else {
      throw Exception('Failed to load Bookings');
    }
  }
}
