import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../bloc/auth_bloc.dart';

class SendOtpButton extends StatelessWidget {
  const SendOtpButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: AppStrings.sendCode,
      textColor: AppColors.whiteColor,
      width: double.infinity,
      backgroundColor: AppColors.primaryColor,
      fontSize: 20,
      onPressed: () {
        // TODO : SEND OTP CODE
        // if (formKey.currentState!.validate()) {}
        context.read<AuthBloc>().add(
              const ChangeCrossFadeState(1),
            );
      },
    );
  }
}
