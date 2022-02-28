// import 'package:car_rental/dao/cardao.dart';
// import 'package:car_rental/model/car_model.dart';
// import 'package:car_rental/sqlmodel/car.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// class MainScreenPart extends StatelessWidget {
//   // final Cars? model;
//   const MainScreenPart({Key? key, required this.product, required this.carDAO}) : super(key: key);
//   final DisplayCar product;
//   final CarDAO carDAO;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Gap(20),
//         Container(
//           decoration: const BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.all(
//               Radius.circular(30),
//             ),
//           ),
//           child: Card(
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(30),
//               ),
//             ),
//             color: Colors.white,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pushNamed(context, '/cardetails', arguments: product);
//               },
//               child: Column(
//                 children: [
//                   Image.network(
//                     "${product.image}",
//                     height: 171,
//                     width: 180,
//                   ),
//                   Text(
//                     "${product.name}",
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   // Text(
//                   //     "Car price: ${model?.rentPerHour}"),
//                   // Text(
//                   //     "Car Capacity: ${model?.capacity}"),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
