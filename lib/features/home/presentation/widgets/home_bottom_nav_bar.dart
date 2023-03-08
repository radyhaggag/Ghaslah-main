import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/utils/color_manager.dart';
import '../bloc/home_bloc.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1.0,
            blurRadius: 8.0,
            offset: const Offset(1, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.0),
        child: GNav(
          padding: const EdgeInsets.all(20),
          mainAxisAlignment: MainAxisAlignment.center,
          backgroundColor: Colors.white,
          tabBorderRadius: 40.0,
          tabBackgroundColor: AppColors.primaryColor.withOpacity(.15),
          activeColor: AppColors.primaryColor,
          color: Colors.black.withOpacity(0.55),
          selectedIndex: context.read<HomeBloc>().selectedIndex,
          onTabChange: (index) {
            context.read<HomeBloc>().add(ChangeHomePageModule(index));
          },
          tabs: const [
            GButton(
              text: 'الصفحة الرئيسية',
              icon: FontAwesomeIcons.store,
            ),
            GButton(
              text: 'الحجوزات',
              icon: FontAwesomeIcons.calendar,
            ),
          ],
        ),
      ),
    );
  }
}
