import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key, required this.discount});

  final double discount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.red,
      margin: const EdgeInsets.only(right: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        child: Text(
          'خصم $discount %',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
      ),
    );
  }
}
