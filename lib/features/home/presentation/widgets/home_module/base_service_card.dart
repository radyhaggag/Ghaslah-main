import 'package:flutter/material.dart';
import '../../../../../config/routes_manager.dart';
import '../../../../../core/utils/extension.dart';
import '../../../data/models/service_model.dart';

class BaseServiceCard extends StatelessWidget {
  const BaseServiceCard({
    Key? key,
    required this.serviceModel,
  }) : super(key: key);

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.bookingWashRoute);
        },
        child: Container(
          width: context.width / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1.0,
                blurRadius: 8.0,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: 70.0,
                fit: BoxFit.contain,
                image: NetworkImage(serviceModel.imageUrl),
              ),
              Flexible(
                child: Text(
                  serviceModel.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                serviceModel.price.toString(),
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
