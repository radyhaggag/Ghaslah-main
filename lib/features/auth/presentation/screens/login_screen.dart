import 'package:flutter/material.dart';
import '../../../../core/utils/color_manager.dart';
import '../widgets/login/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: LoginScreenBody(),
    );
  }
}
