import 'package:flutter/material.dart';

import '../../data/models/service_model.dart';
import '../widgets/additional_service/add_service_button.dart';
import '../widgets/additional_service/additional_service_details_sction.dart';
import '../widgets/additional_service/additional_service_image.dart';

class AdditionalServiceScreen extends StatelessWidget {
  const AdditionalServiceScreen({super.key, required this.serviceModel});

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AdditionalServiceImage(imageUrl: serviceModel.imageUrl),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AdditionalServiceDetailsSection(serviceModel: serviceModel),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AddServiceButton(serviceModel: serviceModel),
          ),
        ],
      ),
    );
  }
}
