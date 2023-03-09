import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'select_gender_dropdown.dart';

import '../../bloc/auth_bloc.dart';

class SelectCityDropdown extends StatelessWidget {
  const SelectCityDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => current is RegisterFieldsUpdate,
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        return DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'أختر المدينة',
            labelStyle: TextStyle(fontSize: 22),
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
