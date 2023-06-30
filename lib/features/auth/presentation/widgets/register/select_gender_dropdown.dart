import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc.dart';

class SelectGenderDropdown extends StatelessWidget {
  const SelectGenderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => current is RegisterGenderFieldsUpdate,
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        return DropdownButtonFormField<String>(
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(
            labelText: 'أختر الجنس',
          ),
          value: authBloc.registerModel.gender,
          onChanged: (String? newValue) {
            authBloc.add(UpdateRegisterModel(gender: newValue));
          },
          items: Gender.values.map((value) {
            String gender = value.getString(context);
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
        );
      },
    );
  }
}

enum Gender { male, female }

extension GenderExtension on Gender {
  String getString(context) {
    switch (this) {
      case Gender.male:
        return "ذكر";
      case Gender.female:
        return "أنثى";
    }
  }
}
