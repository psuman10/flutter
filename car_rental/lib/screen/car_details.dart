// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:car_rental/http/httpbookcar.dart';
import 'package:car_rental/model/bookingnewcar_model.dart';
import 'package:car_rental/model/car_model.dart';
import 'package:car_rental/navbar/bottom_nav.dart';
import 'package:car_rental/screen/forpayment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:motion_toast/motion_toast.dart';

class DetailsPage extends StatefulWidget {
  final Cars? model;
  const DetailsPage({Key? key, this.model}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 1)),
  );

  Future<bool> carBookings(BookingNewCar u) {
    var res = HttpConnectBooking().registerCar(u);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    final model = ModalRoute.of(context)!.settings.arguments as Cars;
    var amount = model.rentPerHour! * difference.inHours;
    Size size = MediaQuery.of(context).size; //check the size of device
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Car Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${model.image}"),
                          fit: BoxFit.cover),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '${model.name}',
                              style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            child: Container(
                              width: 150,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text("Interior",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text("Adventurous",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text("Luxerious",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              )
                            ],
                          ),
                          const Gap(10),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Car Details",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Gap(10),
                          Text(
                            "Rent Per Hour: "
                            'Rs ${model.rentPerHour}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            "Fuel Type: "
                            '${model.fuelType}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            "Total Seats: "
                            '${model.capacity}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  child: Text(
                                    DateFormat('yyyy/MM/dd').format(start),
                                  ),
                                  onPressed: pickDateRange,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  child: Text(
                                    DateFormat('yyyy/MM/dd').format(end),
                                  ),
                                  onPressed: pickDateRange,
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          Text(
                            'Total Days: ${difference.inDays} days',
                            style: TextStyle(fontSize: 20),
                          ),
                          const Gap(10),
                          Text(
                            'Total Amount: Rs$amount',
                            style: TextStyle(fontSize: 20),

                            // 'Total Amount: ${difference.inDays} * ${model.rentPerHour} = ${difference.inDays * model.rentPerHour}',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              // const SizedBox(height: 5),
              CupertinoButton(
                color: Colors.green,
                child: const Text(
                  "Proceed",
                ),
                onPressed: () async {
                  BookingNewCar u = BookingNewCar(
                    car: model.sId,
                    user: model.sId,
                    start: start.toString(),
                    end: end.toString(),
                    totalAmount: amount.toString(),
                    totalHours: difference.inHours.toString(),
                  );
                  print(u);
                  await carBookings(u);
                  Navigator.pushNamed(context, '/card');
                },
              ),
            ],
          ),
        ));
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      currentDate: DateTime.now(),
    );
    if (newDateRange == null) return; //if pressed X
    setState(() => dateRange = newDateRange); //if pressed save
  }
}
