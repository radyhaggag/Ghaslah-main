import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';

import '../../../../../config/app_shared.dart';
import '../../../../../config/routes_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/widgets/custom_button.dart';

class SignOutBtn extends StatelessWidget {
  const SignOutBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        await AppShared.clear(key: 'token');
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.loginScreen,
            (route) => false,
          );
        }
      },
      text: 'تسجيل خروج',
      width: context.width,
      fontSize: 20,
      backgroundColor: AppColors.red,
      textColor: AppColors.whiteColor,
    );
  }
}
