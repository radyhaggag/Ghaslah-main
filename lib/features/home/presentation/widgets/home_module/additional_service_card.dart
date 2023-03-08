import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../data/models/service_model.dart';

class AdditionalServiceCard extends StatelessWidget {
  const AdditionalServiceCard({
    super.key,
    required this.service,
  });

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: [
            Image(
              width: 100.0,
              height: 100.0,
              image: NetworkImage(service.imageUrl),
            ),
            const SizedBox(width: 30),
            Text(
              service.name,
              style: const TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 20.0,
                  color: AppColors.heartGreyColor,
                ),
              ),
            ),
          ],
        ), //
      ),
    );
  }
}
