import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class EnterOtpCodeField extends StatelessWidget {
  const EnterOtpCodeField({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: AppStrings.enterOtpCode,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) return AppStrings.enterOtpCodeValidateMsg;
        return null;
      },
    );
  }
}
