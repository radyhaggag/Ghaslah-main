import 'package:flutter/material.dart';

import '../widgets/my_cars_btn.dart';
import '../widgets/profile_image.dart';
import '../widgets/sign_out_btn.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: const [
          ProfileImage(),
          SizedBox(height: 50),
          MyCarsBtn(),
          SizedBox(height: 20),
          SignOutBtn(),
        ],
      ),
    );
  }
}
