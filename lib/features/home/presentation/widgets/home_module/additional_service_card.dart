import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'discount_card.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../data/models/service_model.dart';
import 'add_service_icon_btn.dart';

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
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                  imageUrl: service.image,
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.name,
                        softWrap: true,
                        style: const TextStyle(
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${service.price} ريال",
                        softWrap: true,
                        style: const TextStyle(
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                AddServiceIconBtn(serviceModel: service),
              ],
            ), //
          ),
          if (service.servicesDiscount != null)
            DiscountCard(
                discount: service.servicesDiscount!.percentage.toDouble()),
        ],
      ),
    );
  }
}
