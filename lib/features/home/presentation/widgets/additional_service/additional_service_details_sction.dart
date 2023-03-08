import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/features/home/data/models/service_model.dart';

import '../../../../../core/utils/color_manager.dart';

class AdditionalServiceDetailsSection extends StatelessWidget {
  const AdditionalServiceDetailsSection(
      {super.key, required this.serviceModel});

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: AppColors.greyColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  serviceModel.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  serviceModel.price.toString(),
                  style: const TextStyle(
                    fontSize: 21.0,
                    color: AppColors.mainTextColor,
                  ),
                ),
              ],
            ),
            const Divider(height: 30, thickness: 3),
            Text(
              'وصف الخدمة',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24.0,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              serviceModel.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 17,
                    color: Colors.black.withOpacity(.7),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
