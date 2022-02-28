import 'package:car_rental/profile_screen/body.dart';
import 'package:car_rental/screen/main_screen.dart';
import 'package:car_rental/screen/search.dart';
import 'package:car_rental/screen/tickets.dart';
import 'package:flutter/material.dart';

class NavBottompract extends StatefulWidget {
  const NavBottompract({Key? key}) : super(key: key);
  @override
  _NavBottompractState createState() => _NavBottompractState();
}

class _NavBottompractState extends State<NavBottompract> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = [
    // Home(),
    Search(),
    Search(),
    BookingConfirmation(),
    Body(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.compare_arrows,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[900],
        // backgroundColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
