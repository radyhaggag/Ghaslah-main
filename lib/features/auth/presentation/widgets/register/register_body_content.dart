import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'select_birthday_section.dart';
import 'select_gender_dropdown.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../bloc/auth_bloc.dart';
import '../text_fields/confirm_password_input_field.dart';
import '../text_fields/email_input_field.dart';
import '../text_fields/name_input_field.dart';
import '../text_fields/password_input_field.dart';
import '../text_fields/phone_input_field.dart';
import 'have_account_msg.dart';
import 'register_button.dart';
import 'select_city_dropdown.dart';

class RegisterBodyContent extends StatefulWidget {
  const RegisterBodyContent({super.key});

  @override
  State<RegisterBodyContent> createState() => _RegisterBodyContentState();
}

class _RegisterBodyContentState extends State<RegisterBodyContent> {
  final GlobalKey<FormState> kForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: kForm,
      child: Column(
        children: [
          Text(
            AppStrings.createNewAccount,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 20),
          NameInputField(
            onChanged: (value) {
              context.read<AuthBloc>().add(
                    UpdateRegisterModel(name: value),
                  );
            },
          ),
          const SizedBox(height: 12),
          EmailInputField(
            onChanged: (value) {
              context.read<AuthBloc>().add(
                    UpdateRegisterModel(email: value),
                  );
            },
          ),
          const SizedBox(height: 12),
          PhoneInputField(
            onChanged: (value) {
              context.read<AuthBloc>().add(
                    UpdateRegisterModel(phoneNumber: value),
                  );
            },
          ),
          const SizedBox(height: 12),
          PasswordInputField(
            onChanged: (value) {
              context.read<AuthBloc>().add(
                    UpdateRegisterModel(password: value),
                  );
            },
          ),
          const SizedBox(height: 12),
          ConfirmPasswordInputField(
            onChanged: (value) {
              context.read<AuthBloc>().add(
                    UpdateRegisterModel(confirmPassword: value),
                  );
            },
          ),
          const SizedBox(height: 12),
          const SelectCityDropdown(),
          const SizedBox(height: 12),
          const SelectGenderDropdown(),
          const SizedBox(height: 12),
          const SelectBirthdaySection(),
          const SizedBox(height: 20),
          RegisterButton(formKey: kForm),
          const SizedBox(height: 40),
          const HaveAccountMsg(),
        ],
      ),
    );
  }
}
