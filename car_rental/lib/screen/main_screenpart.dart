import 'package:car_rental/database/database.dart';
import 'package:car_rental/model/car_model.dart';
import 'package:car_rental/sqlmodel/car.dart';
import 'package:car_rental/utils/strings.dart';
import 'package:flutter/material.dart';

class MainScreenPart extends StatelessWidget {
  const MainScreenPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseService().getCars(context),
        builder: (context, AsyncSnapshot<List<DisplayCar>> snapshot) {
          if (snapshot.hasData) {
          List<DisplayCar> cars = snapshot.data!;
          return ListView(
              children: cars.map((car) => ListTile(
                leading: SizedBox(
                  height: 150.0,
                  width: 50.0, // fixed width and height
                  // child: Image.network(BASE_URL+car.image)
                ),
                // title: Text(car.name),
                subtitle:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Car price: ${car.rentPerHour}"),
                  Text(
                      "Car Capacity: ${car.capacity}"),
                  ]
                ),
              )).toList());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },          
          
        );
  }
}
