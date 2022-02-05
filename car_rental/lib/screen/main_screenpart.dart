import 'package:car_rental/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unicons/unicons.dart';

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
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Card(
            color: Colors.grey,
            
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/car_details', arguments: model);
              },
              child: Column(  
                children: [
                  Image.network(
                    "${model?.image}",
                    height: 170,
                    width: 175,
                    
                  ),
                  Text("${model?.name}", style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
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
