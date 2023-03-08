import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/features/auth/presentation/widgets/login/phone/enter_phone_content.dart';
import 'package:ghaslah/features/auth/presentation/widgets/register/register_body_content.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../bloc/auth_bloc.dart';
import '../login/otp/enter_otp_code_content.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  vertical: 60,
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
                      firstChild: const RegisterBodyContent(),
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
    );
  }
}
