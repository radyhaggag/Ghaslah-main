import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/center_progress_indicator.dart';

import '../bloc/booking_bloc.dart';
import 'car_card.dart';

class CarsBuilder extends StatelessWidget {
  const CarsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: BlocBuilder<BookingBloc, BookingState>(
        buildWhen: (previous, current) {
          if (current is GetAllCarSuccess || current is GetAllCarLoading) {
            return true;
          }
          if (current is GetAllCarFailed) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is GetAllCarSuccess) {
            return Row(
              children: List.generate(
                state.cars.length,
                (index) => CarCard(
                  carModel: state.cars[index],
                ),
              ),
            );
          } else if (state is GetAllCarLoading) {
            return const CenterProgressIndicator();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
