import 'package:flutter/material.dart';

import '../../../../../../config/routes_manager.dart';
import '../../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/app_strings.dart';

class HaveAccountMsg extends StatelessWidget {
  const HaveAccountMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '${AppStrings.haveAccountMsg}\t\t\t',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushReplacementNamed(
            Routes.loginScreen,
          ),
          child: const Text(
            AppStrings.login,
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
