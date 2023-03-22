import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class HomeWelcomeMsg extends StatelessWidget {
  const HomeWelcomeMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.06,
      left: 0.0,
      right: 0.0,
      child: Column(
        children: [
          Text(
            "مرحبا فى",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24,
                  color: Colors.white,
                ),
          ),
          Text(
            AppStrings.ghaslahAr,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 50,
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
