import 'package:flutter/material.dart';
import '../../../../../core/utils/extension.dart';
import '../../../data/models/service_model.dart';
import 'base_service_card.dart';

class BaseServicesBuilder extends StatelessWidget {
  const BaseServicesBuilder({super.key, required this.services});

  final List<ServiceModel> services;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: context.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return BaseServiceCard(
            serviceModel: services[index],
          );
        },
      ),
    );
  }
}
