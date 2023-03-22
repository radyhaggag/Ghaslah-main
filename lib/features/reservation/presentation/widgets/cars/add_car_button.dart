import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../../../config/routes_manager.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../bloc/reservation_bloc.dart';

class AddCarButton extends StatelessWidget {
  const AddCarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      buildWhen: (previous, current) {
        if (current is AddNewCarFailed ||
            current is AddNewCarLoading ||
            current is AddNewCarSuccess) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is AddNewCarLoading) {
          return const CenterProgressIndicator();
        }
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.addCar);
          },
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.car),
                const SizedBox(height: 10),
                Text(
                  AppStrings.addCar,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
