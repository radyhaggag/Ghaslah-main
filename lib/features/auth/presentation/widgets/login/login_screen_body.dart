import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/build_toast.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../bloc/auth_bloc.dart';
import 'phone/enter_phone_content.dart';
import 'otp/enter_otp_code_content.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpCodeSendFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is OtpCodeSendSuccess) {
          context.read<AuthBloc>().add(const ChangeCrossFadeState(1));
        }
        if (state is OtpCodeVerifyFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is OtpCodeVerifySuccess && state.result) {
          buildToast(
            toastType: ToastType.success,
            msg: AppStrings.loginDone,
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.homeRoute,
            (route) => false,
          );
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
                    vertical: 40,
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) {
                      return current is LoginCrossFadeStateChanged;
                    },
                    builder: (context, state) {
                      getState() {
                        if (state is LoginCrossFadeStateChanged &&
                            state.index == 1) {
                          return CrossFadeState.showSecond;
                        }
                        return CrossFadeState.showFirst;
                      }

                      return AnimatedCrossFade(
                        firstChild: const EnterPhoneContent(),
                        secondChild: const EnterOtpCodeContent(),
                        crossFadeState: getState(),
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
