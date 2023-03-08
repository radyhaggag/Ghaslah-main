import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: AppStrings.email,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) return AppStrings.emailValidateMsg;
        return null;
      },
    );
  }
}
