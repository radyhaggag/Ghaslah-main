import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isVisitable = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: AppStrings.password,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => isVisitable = !isVisitable);
          },
          icon: isVisitable
              ? const Icon(Icons.remove_red_eye_outlined)
              : const Icon(Icons.remove_red_eye),
        ),
      ),
      obscureText: isVisitable ? false : true,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value!.isEmpty) return AppStrings.passwordValidateMsg;
        return null;
      },
    );
  }
}
