import 'package:car_rental/screen/login.dart';
import 'package:car_rental/screen/theme.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Profile",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.pushNamed(context, '/userprofile'),
            },
          ),
          ProfileMenu(
            text: "Bookings",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Theme",
            icon: "assets/icons/Settings.svg",
            press: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          ),
          ProfileMenu(
            text: "Add Product",
            icon: "assets/icons/add.svg",
            press: () {
              Navigator.pushNamed(context, '/addcar');
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
              final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
              sharedpreferences.remove('userid');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext ctx) => const LoginScreen()));
              MotionToast.success(
                description: const Text('Logout Successfully'),
                toastDuration: const Duration(seconds: 1),
              ).show(context);
            },
          ),
        ],
      ),
    );
  }
}


