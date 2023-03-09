import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/color_manager.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../bloc/auth_bloc.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is RegisterUserLoading) {
        return const CenterProgressIndicator();
      }
      return CustomButton(
        text: AppStrings.createNewAccount,
        textColor: AppColors.whiteColor,
        width: double.infinity,
        backgroundColor: AppColors.primaryColor,
        fontSize: 20,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<AuthBloc>().add(RegisterUser());
          }
        },
      );
    });
  }
}
