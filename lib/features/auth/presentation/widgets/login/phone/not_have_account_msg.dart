import 'package:flutter/material.dart';

import '../../../../../../config/routes_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/app_strings.dart';

class NotHaveAccountMsg extends StatelessWidget {
  const NotHaveAccountMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '${AppStrings.notHaveAccountMsg}\t\t\t',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushReplacementNamed(
            Routes.registerRoute,
          ),
          child: const Text(
            AppStrings.signFromHere,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
