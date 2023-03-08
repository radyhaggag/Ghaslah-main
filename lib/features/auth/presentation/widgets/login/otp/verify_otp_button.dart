import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../bloc/auth_bloc.dart';

class VerifyOtpButton extends StatelessWidget {
  const VerifyOtpButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: AppStrings.verifyCode,
      textColor: AppColors.whiteColor,
      width: double.infinity,
      backgroundColor: AppColors.primaryColor,
      fontSize: 20,
      onPressed: () {
        // TODO : Verify OTP CODE
        // if (formKey.currentState!.validate()) {}
        context.read<AuthBloc>().add(ChangeCrossFadeState(0));
      },
    );
  }
}
