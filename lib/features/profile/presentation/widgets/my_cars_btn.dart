import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';

import '../../../../../core/widgets/custom_button.dart';

class MyCarsBtn extends StatelessWidget {
  const MyCarsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      text: 'سياراتى',
      width: context.width,
      fontSize: 20,
      textColor: Colors.white,
    );
  }
}
