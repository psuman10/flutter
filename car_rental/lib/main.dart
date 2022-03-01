// import 'package:car/carpage/widgets/bottom_nav.dart';
import 'package:car_rental/dao/cardao.dart';
import 'package:car_rental/database/database.dart';
import 'package:car_rental/http/httpuser.dart';
import 'package:car_rental/navbar/bottom_nav.dart';
import 'package:car_rental/profile/screen.dart';
import 'package:car_rental/screen/addcar.dart';
import 'package:car_rental/screen/car_details.dart';
import 'package:car_rental/screen/forpayment.dart';
import 'package:car_rental/screen/login.dart';
import 'package:car_rental/screen/register.dart';
import 'package:car_rental/screen/theme.dart';
import 'package:car_rental/screen/tickets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(null, // icon for your app notification
      [
        NotificationChannel(
            channelKey: 'Car Rental',
            channelName: 'Car Rental',
            channelDescription: "Car Rental Notification",
            defaultColor: const Color(0xFF105F49),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            enableVibration: true)
      ]);

  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('car_database.db').build();
  final dao = database.carDAO;
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: MyApp(dao: dao),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.dao,
  }) : super(key: key);
  final CarDAO dao;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Car Rental',
          theme: value.getTheme(),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/nav': (context) => const NavBottompract(),
            '/userprofile': (context) => const UserProfile(),
            '/cardetails': (context) => const DetailsPage(),
            '/addcar': (context) => const AddCar(),
            '/successful': (context) => const BookingConfirmation(),
            '/card': (context) => const CreditCard(),
          },
        );
      },
    );
  }
}
