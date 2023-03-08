import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghaslah/features/booking/presentation/views/booking_page.dart';
import 'package:ghaslah/features/gifts/presentation/views/gifts_screen.dart';
import 'package:ghaslah/features/profile/presentation/views/profile_page.dart';
import 'package:ghaslah/features/car_store/presentation/views/car_store_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/utils/color_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List _listPages = <Widget>[
    const CarStorePage(),
    const BookingPage(),
    const GiftsScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.greyColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(
          18.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              spreadRadius: 1.0,
              blurRadius: 8.0,
              offset: const Offset(
                1,
                1,
              ),
            ),
          ],
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35.0),
          child: GNav(
            gap: 13.0,
            backgroundColor: Colors.white,
            tabBorderRadius: 40.0,
            tabBackgroundColor: AppColors.pinkAccentColor,
            activeColor: AppColors.redCircleColor,
            color: Colors.black.withOpacity(0.55),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              _gButton('Home', FontAwesomeIcons.store),
              _gButton('bookings', FontAwesomeIcons.calendar),
              _gButton('Gifts', FontAwesomeIcons.gift),
              _gButton('Profile', FontAwesomeIcons.circleUser),
            ],
          ),
        ),
      ),
      body: _listPages.elementAt(_selectedIndex),
    );
  }

  GButton _gButton(String text, IconData icon) => GButton(
        icon: icon,
        text: text,
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 15.0,
          top: 15.0,
          bottom: 15.0,
        ),
      );
}
