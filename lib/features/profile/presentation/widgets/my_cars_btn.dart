import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../config/routes_manager.dart';

class MyCarsBtn extends StatelessWidget {
  const MyCarsBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.cars);
      },
      text: 'سياراتى',
      width: context.width,
      fontSize: 20,
      textColor: Colors.white,
    );
  }
}
