import 'package:flutter/material.dart';
import 'package:ghaslah/features/home/presentation/widgets/home_module/discount_card.dart';

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
                Image(
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                  image: NetworkImage(service.image),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Text(
                    service.name,
                    softWrap: true,
                    style: const TextStyle(
                      color: AppColors.mainTextColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                AddServiceIconBtn(serviceModel: service),
              ],
            ), //
          ),
          if (service.servicesDiscount != null)
            DiscountCard(discount: service.servicesDiscount!),
        ],
      ),
    );
  }
}
