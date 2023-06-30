import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class AddHintInputField extends StatelessWidget {
  const AddHintInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      minLines: 1,
      decoration: InputDecoration(
        labelText: AppStrings.setNotice,
        hintText: AppStrings.setNotice,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
