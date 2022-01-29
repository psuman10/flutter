import 'package:car_rental/utils/layouts.dart';
import 'package:car_rental/utils/styles.dart';
import 'package:car_rental/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      // backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(60),
          const Text('What are\nyou looking for?',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          const Gap(20),
          FittedBox(
            child: Container(
              padding: const EdgeInsets.all(3.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFFF4F6FD)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width*0.44,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(left: Radius.circular(50)),
                      color: Colors.grey[400]
                    ),
                    child: Center(child: Text('Car', style: Styles.subtitle1Style.copyWith(fontWeight: FontWeight.w600,  color: Colors.grey.shade800),)),
                  ),
                  const Gap(5),
                  Container(
                    width: size.width*0.44,
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                      color: Colors.transparent
                    ),
                    child: Center(child: Text('Vans', style: Styles.subtitle1Style.copyWith(fontWeight: FontWeight.w600),)),
                  ),
                ],
              ),
            ),
          ),
          
          const Gap(25), 
          const SizedBox(height: 18),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                          color: Colors.white,
                          
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),

                        decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.car_rental_rounded),
                          
                          
                      enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              
                                color: Colors.white, width: 4.0),
                          ),
                          
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 6.0)),
                       fillColor: Colors.white,
                      labelText: 'From',
                      
                     
                      // border: OutlineInputBorder(),
                    ),
                    ),
                    const Gap(20),

                    TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                          color: Colors.white,
                          
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),

                        decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.directions_bus_sharp),
                          
                          
                      enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              
                                color: Colors.white, width: 4.0),
                          ),
                          
                          labelStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 6.0)),
                       fillColor: Colors.white,
                      labelText: 'To',
                      
                     
                      // border: OutlineInputBorder(),
                    ),
                    ),
                    
          
          
          
          const Gap(25),
          elevatedButton(context: context, callback: () {}, text: 'Find Vehicles', ),
          const Gap(40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text('Offers',style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              InkWell(
                child: Text('View all',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              )
            ],
          ),
          const Gap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width*0.42,
                height: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 2,
                    spreadRadius: 4
                      )
                        ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                          color: Styles.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                               image: AssetImage('assets/images/carrr.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    const Gap(12),
                    Text('Lauching Soon, "Pre Order Available".', style: Styles.headline2Style.copyWith(fontWeight: FontWeight.w500, fontSize: 19.5, color: Styles.textColor.withOpacity(0.8)),),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width*0.44,
                        height: 174,
                        decoration: BoxDecoration(
                          color: const Color(0xFF3AB8B8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Discount\nfor survey', style: Styles.headline2Style.copyWith(fontWeight: FontWeight.bold, ),),
                            const Gap(10),
                            Text('Take the survey about our services and get a discount', style: Styles.headline2Style.copyWith(fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.9), fontSize: 18),),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 18, color: const Color(
                                0xFF189999)),
                            color: Colors.transparent
                          ),
                        ),
                      )
                    ],
                  ),
                  const Gap(15),
                  Container(
                width: size.width*0.42,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 2,
                    spreadRadius: 1
                      )
                        ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                          color: Styles.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                               image: AssetImage('assets/images/car.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    
                  ],
                ),
              ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}