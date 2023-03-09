import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../config/app_shared.dart';
import '../../../../config/routes_manager.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/utils/color_manager.dart';
import 'splash_image.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
    if (context.mounted) {
      _timer = Timer(
        const Duration(milliseconds: 2000),
        () => _checkIfUserLoggedIn(),
      );
    }
  }

  _checkIfUserLoggedIn() {
    final token = AppShared.getString(key: 'token');
    if (token != null) {
      Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: AppColors.primaryColor,
      child: FadeTransition(
        opacity: _animation,
        child: const SplashImage(),
      ),
    );
  }
}
