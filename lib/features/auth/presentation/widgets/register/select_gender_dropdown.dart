import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../bloc/auth_bloc.dart';

class SelectGenderDropdown extends StatelessWidget {
  const SelectGenderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      buildWhen: (previous, current) => current is RegisterFieldsUpdate,
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: DropdownButton<String>(
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
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 42,
            underline: const SizedBox(),
          ),
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
