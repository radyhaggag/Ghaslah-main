import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/birthday_model.dart';
import '../../bloc/auth_bloc.dart';

class SelectBirthdaySection extends StatelessWidget {
  const SelectBirthdaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.birthday,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 18,
              ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 80,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime(1980, 1, 1),
            maximumDate: DateTime.now(),
            onDateTimeChanged: (DateTime newDateTime) {
              context.read<AuthBloc>().add(UpdateRegisterModel(
                    birthDay: BirthDayModel(
                      day: newDateTime.day,
                      month: newDateTime.month,
                      year: newDateTime.year,
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
