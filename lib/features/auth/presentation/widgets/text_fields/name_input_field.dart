import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: AppStrings.name,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) return AppStrings.nameValidateMsg;
        return null;
      },
    );
  }
}
