import 'package:car_rental/model/bookingnewcar_model.dart';
import 'package:car_rental/utils/layouts.dart';
import 'package:car_rental/utils/styles.dart';
import 'package:car_rental/widgets/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserBooking extends StatefulWidget {
  final BookingNewCar? model;

  const UserBooking({Key? key, this.model}) : super(key: key);

  @override
  State<UserBooking> createState() => _UserBookingState();
}

class _UserBookingState extends State<UserBooking> {
  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      // backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              const Gap(60),
              const Text('Bookings',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900)),
              const Gap(20),
              FittedBox(
                child: Container(
                  padding: const EdgeInsets.all(3.5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFF4F6FD)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.44,
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50)),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          'Recent',
                          style: Styles.subtitle1Style.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Styles.textColor),
                        )),
                      ),
                      const Gap(5),
                      Container(
                        width: size.width * 0.44,
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(50)),
                            color: Colors.transparent),
                        child: Center(
                            child: Text(
                          'Previous',
                          style: Styles.subtitle1Style.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(25),
              const Gap(20),
              Container(
                  padding: const EdgeInsets.only(left: 15, right: 0),
                  child: const TicketView(
                    isOrange: true,
                  ))
            ],
          ),
          Positioned(
            top: 309,
            left: 25,
            child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(color: Styles.textColor, width: 2),
                    shape: BoxShape.circle),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                )),
          ),
          Positioned(
            top: 309,
            right: 25,
            child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    border: Border.all(color: Styles.textColor, width: 2),
                    shape: BoxShape.circle),
                child: CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                )),
          ),
          
        ],
        
      ),
      
    );
  }
}
