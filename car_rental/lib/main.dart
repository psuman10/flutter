// import 'package:car/carpage/widgets/bottom_nav.dart';
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
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("darkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: const MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Car Rental',
          theme: value.getTheme(),
          routes: {
            '/': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/nav': (context) => const NavBottompract(),
            '/userprofile': (context) => const UserProfile(),
            '/car_details': (context) => const DetailsPage(),
            '/addcar': (context) => const AddCar(),
            '/userbookings': (context) => const UserBooking(),
            '/card': (context) => const CreditCard(),
            '/userbook': (context) => const UserBooking(),
          },
        );
      },
    );
  }
}
