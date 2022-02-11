import 'package:car_rental/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MainScreenPart extends StatelessWidget {
  final Cars? model;
  const MainScreenPart({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Container(
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),            
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/car_details', arguments: model);
              },
              child: Column(
                children: [
                  Image.network(
                    "${model?.image}",
                    height: 171,
                    width: 180,
                  ),
                  Text(
                    "${model?.name}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    
                  ),
                  // Text(
                  //     "Car price: ${model?.rentPerHour}"),
                  // Text(
                  //     "Car Capacity: ${model?.capacity}"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
