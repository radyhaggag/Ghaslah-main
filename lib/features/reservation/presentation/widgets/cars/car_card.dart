import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../data/models/car_model.dart';
import '../../bloc/reservation_bloc.dart';

import '../../../../../core/utils/color_manager.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.carModel,
    this.width,
    this.iconSize,
    this.mainTextSize,
    this.descFontSize,
    this.isSelectable,
  });

  final CarModel carModel;
  final double? width;
  final double? iconSize;
  final double? mainTextSize;
  final double? descFontSize;
  final bool? isSelectable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      buildWhen: (previous, current) {
        return current is ReservationCarSelected;
      },
      builder: (context, state) {
        return TextButton(
          onPressed: isSelectable != null || isSelectable == false
              ? null
              : () {
                  context
                      .read<ReservationBloc>()
                      .add(SelectReservationCar(carModel));
                },
          child: Container(
            width: width ?? 150,
            height: 150,
            decoration: BoxDecoration(
              color:
                  state is ReservationCarSelected && state.carModel == carModel
                      ? AppColors.primaryColor.withOpacity(.5)
                      : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.car,
                  color: AppColors.primaryColor,
                  size: iconSize,
                ),
                const SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    carModel.color,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: mainTextSize,
                        ),
                  ),
                ),
                FittedBox(
                  child: Text(
                    carModel.model,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: descFontSize,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
