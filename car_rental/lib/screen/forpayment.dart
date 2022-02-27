// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:car_rental/http/httpbookcar.dart';
import 'package:car_rental/model/bookingnewcar_model.dart';
import 'package:car_rental/model/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: bottom),
        reverse: true,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/credit_card.png",
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                              child: Text(
                                "**** **** **** 8690",
                                style: TextStyle(
                                    fontSize: 28.0, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: <Widget>[
                                Column(
                                  children: const <Widget>[
                                    Text(
                                      "Expiry",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "MM/YY",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Column(
                                  children: const <Widget>[
                                    Text(
                                      "CVV",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22.0),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "****",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Card Holder",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 28.0),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  elevation: 5.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(),
                              ),
                              labelText: "Credit Card Number",
                              labelStyle: TextStyle(fontSize: 18.0)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(),
                              ),
                              labelText: "Credit Card Expiry Date",
                              labelStyle: TextStyle(fontSize: 18.0)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(),
                              ),
                              labelText: "Credit Card Code",
                              labelStyle: TextStyle(fontSize: 18.0)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(),
                              ),
                              labelText: "Credit Card Holder Name",
                              labelStyle: TextStyle(fontSize: 18.0)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(),
                              ),
                              labelText: "Total Amount",
                              labelStyle: TextStyle(fontSize: 18.0)),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CupertinoButton(
                          color: Colors.green,
                          child: const Text(
                            "Pay",
                          ),
                          onPressed: () async {
                            Navigator.pushNamed(context, '/successful');
                            MotionToast.success(
                              description: const Text('Booking Successful'),
                              toastDuration: const Duration(seconds: 1),
                            ).show(context);
                            AwesomeNotifications().createNotification(
                                content: NotificationContent(
                              id: 1,
                              channelKey: 'Car Rental',
                              title: 'Booking Successful',
                              body: 'Booking Successfull',
                            ));
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
