import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';

import '../../../../../config/routes_manager.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/service_model.dart';
import 'additional_service_card.dart';

class AdditionalServicesBuilder extends StatelessWidget {
  const AdditionalServicesBuilder({super.key, required this.services});

  final List<ServiceModel> services;

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.chooseExtendService,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: context.height * .3,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.additionalService,
                    arguments: services[index],
                  );
                },
                child: AdditionalServiceCard(service: services[index]),
              );
            },
            itemCount: services.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(
              height: 15.0,
            ),
          ),
        ),
      ],
    );
  }
}
