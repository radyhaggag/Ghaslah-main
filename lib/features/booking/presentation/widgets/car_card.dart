import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghaslah/features/home/data/models/car_model.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/utils/color_manager.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.car,
            color: HexColor(carModel.color),
          ),
          const SizedBox(height: 10),
          Text(
            carModel.model,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (carModel.cardSignNumbers != null)
            Text(
              carModel.cardSignNumbers!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
    );
  }
}
