import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../data/models/car_model.dart';
import '../bloc/booking_bloc.dart';

import '../../../../core/utils/color_manager.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.carModel});

  final CarModel carModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      buildWhen: (previous, current) {
        return current is BookingCarSelected;
      },
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            context.read<BookingBloc>().add(SelectBookingCar(carModel));
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: state is BookingCarSelected && state.carModel == carModel
                  ? AppColors.primaryColor.withOpacity(.5)
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.car,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    carModel.color,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                FittedBox(
                  child: Text(
                    carModel.model,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
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
