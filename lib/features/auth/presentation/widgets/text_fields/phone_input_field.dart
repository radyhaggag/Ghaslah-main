import 'package:flutter/material.dart';

import '../../../../../core/utils/strings_manager.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: AppStrings.phoneNumber,
        suffixText: '+966',
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) return AppStrings.emptyPhoneNumberMsg;
        if (value.length != 7) return AppStrings.invalidPhoneNumberMsg;
        return null;
      },
    );
  }
}
