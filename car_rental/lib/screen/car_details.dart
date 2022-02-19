import 'package:car_rental/model/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:unicons/unicons.dart';

class DetailsPage extends StatefulWidget {
  final Cars? model;
  const DetailsPage({Key? key, this.model}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as Cars;
    Size size = MediaQuery.of(context).size; //check the size of device
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0), //appbar size
        child: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.05,
            ),
            child: SizedBox(
              height: size.width * 0.1,
              width: size.width * 0.1,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/nav');
                },
                child: Icon(
                  UniconsLine.multiply,
                  color: Colors.white,
                  size: size.height * 0.04,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Text(
            'Vehicle Details',
            // textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const Gap(20),
          Image.network("${model.image}"),
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${model.name}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        '${model.rentPerHour}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        '${model.fuelType}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 12),
          // CupertinoButton(
          //   color: Colors.green,
          //   child: const Text(
          //     "Proceed",
          //   ),
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/payment');
          //   },
          // ),
        ],
      ),
    );
  }
}
