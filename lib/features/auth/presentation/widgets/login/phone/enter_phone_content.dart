import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../text_fields/phone_input_field.dart';
import 'send_otp_button.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../bloc/auth_bloc.dart';
import 'not_have_account_msg.dart';

class EnterPhoneContent extends StatefulWidget {
  const EnterPhoneContent({super.key});

  @override
  State<EnterPhoneContent> createState() => _EnterPhoneContentState();
}

class _EnterPhoneContentState extends State<EnterPhoneContent> {
  GlobalKey<FormState> kForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: kForm,
      child: Column(
        children: [
          Text(
            AppStrings.enterPhoneNumber,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 20),
          PhoneInputField(
            onChanged: (value) {
              context.read<AuthBloc>().add(UpdatePhoneNumber(value));
            },
          ),
          const SizedBox(height: 20),
          SendOtpButton(formKey: kForm),
          const SizedBox(height: 40),
          const NotHaveAccountMsg(),
        ],
      ),
    );
  }
}
