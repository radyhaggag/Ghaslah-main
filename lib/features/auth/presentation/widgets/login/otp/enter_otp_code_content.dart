import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/utils/color_manager.dart';
import 'package:ghaslah/features/auth/presentation/widgets/text_fields/otp_code_input_field.dart';
import 'package:ghaslah/features/auth/presentation/widgets/login/otp/verify_otp_button.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../bloc/auth_bloc.dart';

class EnterOtpCodeContent extends StatefulWidget {
  const EnterOtpCodeContent({super.key});

  @override
  State<EnterOtpCodeContent> createState() => _EnterOtpCodeContentState();
}

class _EnterOtpCodeContentState extends State<EnterOtpCodeContent> {
  GlobalKey<FormState> kForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: kForm,
      child: Column(
        children: [
          Text(
            AppStrings.enterOtpCodeMsg,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 20),
          EnterOtpCodeField(
            onChanged: (value) {
              context.read<AuthBloc>().add(UpdateOtpCode(value));
            },
          ),
          const SizedBox(height: 20),
          VerifyOtpButton(formKey: kForm),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const ChangeCrossFadeState(0));
            },
            child: Text(
              AppStrings.back,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
