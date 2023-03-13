import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../core/functions/build_toast.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../bloc/auth_bloc.dart';
import 'register_body_content.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterUserFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is RegisterUserSuccess) {
          buildToast(
            toastType: ToastType.success,
            msg: AppStrings.registerDone,
          );
          Navigator.of(context).popAndPushNamed(Routes.loginScreen);
        }
      },
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Column(
              children: [
                Image.asset(
                  AssetsManager.logoImage,
                  height: MediaQuery.of(context).size.height / 4,
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const RegisterBodyContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
