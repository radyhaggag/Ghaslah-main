import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavItem extends GButton {
  const BottomNavItem({super.key, required super.icon, required super.text});

  Widget build(BuildContext context) {
    return GButton(
      icon: icon,
      text: text,
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
        bottom: 15.0,
      ),
    );
  }
}
