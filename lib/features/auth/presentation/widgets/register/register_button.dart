import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../bloc/auth_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: AppStrings.createNewAccount,
      textColor: AppColors.whiteColor,
      width: double.infinity,
      backgroundColor: AppColors.primaryColor,
      fontSize: 20,
      onPressed: () {
        // TODO : RegisterUser
        // if (formKey.currentState!.validate()) {}
        // context.read<AuthBloc>().add(RegisterUser());
        context.read<AuthBloc>().add(const ChangeCrossFadeState(1));
      },
    );
  }
}
