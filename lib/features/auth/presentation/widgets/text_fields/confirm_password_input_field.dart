import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../bloc/auth_bloc.dart';

class ConfirmPasswordInputField extends StatefulWidget {
  const ConfirmPasswordInputField({super.key, this.controller, this.onChanged});

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  State<ConfirmPasswordInputField> createState() =>
      _ConfirmPasswordInputFieldState();
}

class _ConfirmPasswordInputFieldState extends State<ConfirmPasswordInputField> {
  bool isVisitable = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: AppStrings.confirmPassword,
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
        if (value != context.read<AuthBloc>().registerModel.password) {
          return AppStrings.confirmPasswordValidateMsg;
        }
        return null;
      },
    );
  }
}
