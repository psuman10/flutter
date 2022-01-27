import 'package:car_rental/utils/layouts.dart';
import 'package:car_rental/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelView extends StatelessWidget{
  final Map<String, dynamic> car;

  const HotelView({Key? key, required this.car}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Container(
      width: size.width*0.6,
      height: 330,
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
              color: Colors.red,
              blurRadius: 2,
              spreadRadius: 1
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/${car['image']}'),
                fit: BoxFit.cover
              )
            ),
          ),
          const Gap(10),
          Text(car['place'], style: Styles.headline2Style.copyWith(fontWeight: FontWeight.w600),),
          const Gap(5),
          Text(car['destination'], style: Styles.subtitle1Style),
          const Gap(8),
          Text('\$${car['price']}/day', style: Styles.headline1Style.copyWith(),),
        ],
      ),
    );
  }
}
