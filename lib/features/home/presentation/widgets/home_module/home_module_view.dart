import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/features/home/data/models/service_model.dart';

import '../../../../../core/utils/app_strings.dart';
import 'additional_services_builder.dart';
import 'base_services_builder.dart';
import 'home_gradient.dart';
import 'home_welcome_message.dart';

class HomeModuleView extends StatelessWidget {
  const HomeModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    var services2 = [
      ServiceModel(
        name: 'غسل سيارة',
        description: 'غسل سياراات',
        price: 30.0,
        serviceType: 'رئيسية',
        date: '2025/2/4',
        imageUrl:
            'https://cars.usnews.com/static/images/Auto/izmo/i159615234/2023_acura_integra_angularfront.jpg',
      ),
      ServiceModel(
        name: 'غسل سيارة',
        description: 'غسل سياراات',
        price: 30.0,
        serviceType: 'رئيسية',
        date: '2025/2/4',
        imageUrl:
            'https://cars.usnews.com/static/images/Auto/izmo/i159615234/2023_acura_integra_angularfront.jpg',
      ),
      ServiceModel(
        name: 'غسل سيارة',
        description: 'غسل سياراات',
        price: 30.0,
        serviceType: 'رئيسية',
        date: '2025/2/4',
        imageUrl:
            'https://cars.usnews.com/static/images/Auto/izmo/i159615234/2023_acura_integra_angularfront.jpg',
      ),
      ServiceModel(
        name: 'غسل سيارة',
        description: 'غسل سياراات',
        price: 30.0,
        serviceType: 'رئيسية',
        date: '2025/2/4',
        imageUrl:
            'https://cars.usnews.com/static/images/Auto/izmo/i159615234/2023_acura_integra_angularfront.jpg',
      ),
    ];
    return Stack(
      children: [
        const HomeGradient(),
        const HomeWelcomeMsg(),
        Padding(
          padding: const EdgeInsets.only(top: 200, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseServicesBuilder(
                services: services2,
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.chooseExtendService,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              AdditionalServicesBuilder(services: services2),
            ],
          ),
        ),
      ],
    );
  }
}
