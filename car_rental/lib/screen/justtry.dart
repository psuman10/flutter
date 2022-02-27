// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';

// class BookingConfirmation extends StatelessWidget {
//   const BookingConfirmation({Key? key}) : super(key: key);

//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//     );
//   }

//   Widget BookingProduct() {
//     return Card(
//       child: Container(
//         height: 150,
//         child: Column(
//           children: [
//             Expanded(
//               flex: 2,
//               child: Row(
//                 children: [
//                   Expanded(
//                       flex: 2,
//                       child: Padding(
//                         padding: EdgeInsets.all(15.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             image: DecorationImage(
//                               image: AssetImage('assets/images/for.jpg'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       )),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 10.0,
//                         vertical: 20.0,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: const [
//                           Text(
//                             'Fortuner',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.red,
//                             ),
//                           ),
//                           Text(
//                             'Total Hours: 2',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'From: 02/27/2020',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'To: 03/2/2020',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'Total Price: Rs100',
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                       child: Container(
//                     padding: EdgeInsets.all(10.0),
//                     child: CircleAvatar(
//                       radius: 25,
//                       backgroundColor: Colors.green,
//                       child: Icon(
//                         Icons.check,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(),
//       // backgroundColor: AppColors.background,
//       body: ListView(
//         children: [
//           Container(
//             margin: EdgeInsets.only(bottom: 10.0),
//             color: Colors.black12,
//             child: SizedBox(
//               child: ListTile(
//                 title: Text(
//                   "Confirmed",
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     // color: Colors.green,
//                   ),
//                 ),
//                 subtitle: Text("Booking Id: 621a05f1fad02cfc925c65da"),
//               ),
//             ),
//           ),
//           BookingProduct(),
//         ],
//       ),
//     );
//   }
// }
