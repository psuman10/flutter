// import 'package:car_rental/screen/main_screenpart.dart';
// import 'package:car_rental/screen/theme.dart';
// import 'package:car_rental/sqlmodel/car.dart';
// import 'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gap/gap.dart';
// import 'package:provider/provider.dart';
// import 'package:unicons/unicons.dart';
// import 'package:snippet_coder_utils/ProgressHUD.dart';
// import 'package:shake/shake.dart';
// import 'dart:async';
// // import 'package:all_sensors/all_sensors.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   bool isApiCallProcess = false;
//   bool _proximityValues = false;
//   List<StreamSubscription<dynamic>> _streamSubscriptions =
//       <StreamSubscription<dynamic>>[];

//   @override
//   void dispose() {
//     super.dispose();
//     for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
//       subscription.cancel();
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // _streamSubscriptions.add(proximityEvents.listen((ProximityEvent event) {
//     //   setState(() {
//     //     _proximityValues = event.getValue();
//     //     print(_proximityValues);
//     //   });
//     // }));
//     ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
//       Provider.of<ThemeProvider>(context, listen: false).swapTheme();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         bottomOpacity: 0.0,
//         elevation: 0.0,
//         shadowColor: Colors.transparent,
//         leading: Padding(
//           padding: EdgeInsets.only(
//             left: size.width * 0.05,
//           ),
//           child: SizedBox(
//             height: size.width * 0.1,
//             width: size.width * 0.1,
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//               ),
//               child: Icon(
//                 UniconsLine.bars,
//                 size: size.height * 0.025,
//               ),
//             ),
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         titleSpacing: 0,
//         leadingWidth: size.width * 0.15,
//         title: Image.asset(
//           'assets/images/loogoo.jpg',
//           height: size.height * 0.06,
//           width: size.width * 0.35,
//         ),
//         centerTitle: true,
//         actions: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               right: size.width * 0.05,
//             ),
//             child: SizedBox(
//               height: size.width * 0.1,
//               width: size.width * 0.1,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                 ),
//                 child: Icon(
//                   UniconsLine.car,
//                   size: size.height * 0.025,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: ProgressHUD(
//         child: loadCars(),
//         inAsyncCall: isApiCallProcess,
//         opacity: 0.3,
//         key: UniqueKey(),
//       ),
//     );
//   }

//   Widget loadCars() {
//     return FutureBuilder(
//       future: readJSONDatabase(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(
//             child: Text('${snapshot.error}'),
//           );
//         } else if (snapshot.hasData) {
//           return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.count(
//                   childAspectRatio: 0.7,   
//                   crossAxisCount: 2,
//                   children: List.generate(snapshot.data.length, (index) {
//                     return Center(
//                         child: MainScreenPart(
//                             carDAO: widget.dao, 
//                             product: snapshot.data[index]));
//                   })));
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },

//       // future: HttpConnectCar().getCars(),
//       // builder: (
//       //   BuildContext context,
//       //   AsyncSnapshot<List<Cars>?> model,
//       // ) {
//       //   if (model.hasData) {
//       //     return carList(model.data);
//       //   }
//       //   return const Center(
//       //     child: CircularProgressIndicator(),
//       //   );
//       // },
//     );
//   }

//   Widget carList(cars) {
//     return SingleChildScrollView(
//         child: Column(
//       // mainAxisAlignment: MainAxisAlignment.spaceAround,
//       // crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   children: [
//                     const Gap(40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'Car Rental',
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w600),
//                             ),
//                             Gap(4),
//                             Text(
//                               'Your Choice',
//                               style: TextStyle(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: const BoxDecoration(
//                               shape: BoxShape.circle,
//                               image: DecorationImage(
//                                   image: AssetImage('assets/images/logo.jpg'),
//                                   fit: BoxFit.cover)),
//                         )
//                       ],
//                     ),
//                     const Gap(25),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 12, horizontal: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey,
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(FluentSystemIcons.ic_fluent_search_regular,
//                               color: Colors.black),
//                           const Gap(5),
//                           InkWell(
//                             child: const Text(
//                               'Search',
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500),
//                             ),
//                             onTap: () {},
//                           )
//                         ],
//                       ),
//                     ),
//                     const Gap(30)
//                   ],
//                 )),
//             Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text('Cars',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w500)),
//                     InkWell(
//                       child: Text('View all',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500)),
//                     )
//                   ],
//                 )),
//             // GridView.builder(
//             //   shrinkWrap: true,
//             //   physics: const ClampingScrollPhysics(),
//             //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             //     crossAxisCount: 2,
//             //     childAspectRatio: 0.85,
//             //     crossAxisSpacing: 5,
//             //   ),
//             //   itemCount: cars.length,
//             //   itemBuilder: (context, index) {
//             //     return MainScreenPart(model: cars[index]);
//             //   },
//             // ),
//           ],
//         ) 
//       ],
//     ));
//   }

//   Future <List<DisplayCar>>readJSONDatabase() async {
//     final raw data = await rootBundle.loadString('assets/data/response.json');
//   }
// }
