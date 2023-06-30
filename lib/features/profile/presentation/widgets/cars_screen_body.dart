import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/core/widgets/center_progress_indicator.dart';

import '../../../reservation/presentation/bloc/reservation_bloc.dart';
import '../../../reservation/presentation/widgets/cars/car_card.dart';

class CarsScreenBody extends StatefulWidget {
  const CarsScreenBody({super.key});

  @override
  State<CarsScreenBody> createState() => _CarsScreenBodyState();
}

class _CarsScreenBodyState extends State<CarsScreenBody> {
  @override
  void initState() {
    context.read<ReservationBloc>().add(GetAllCars());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocBuilder<ReservationBloc, ReservationState>(
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
          if (state is GetAllCarLoading) {
            return const CenterProgressIndicator();
          } else if (state is GetAllCarSuccess) {
            return ListView(
              children: List.generate(
                state.cars.length,
                (index) => CarCard(
                  carModel: state.cars[index],
                  width: context.width,
                  iconSize: 40,
                  mainTextSize: 22,
                  descFontSize: 16,
                  isSelectable: false,
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
