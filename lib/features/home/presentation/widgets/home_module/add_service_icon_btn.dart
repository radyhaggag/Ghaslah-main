import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../data/models/service_model.dart';
import '../../bloc/home_bloc.dart';

class AddServiceIconBtn extends StatelessWidget {
  const AddServiceIconBtn({super.key, required this.serviceModel});
  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current is AdditionalServiceForReservationAdded) {
          return true;
        }
        if (current is AdditionalServiceForReservationRemoved) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final reservationBloc = context.read<HomeBloc>();
        getCrossFade() {
          if (reservationBloc.additionalServiceSelected
              .contains(serviceModel)) {
            return CrossFadeState.showSecond;
          } else {
            return CrossFadeState.showFirst;
          }
        }

        return TextButton(
          onPressed: () {
            if (reservationBloc.additionalServiceSelected
                .contains(serviceModel)) {
              reservationBloc
                  .add(RemoveAdditionalServiceForReservation(serviceModel));
            } else {
              reservationBloc
                  .add(AddAdditionalServiceForReservation(serviceModel));
            }
          },
          style: TextButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.grey.shade200,
            padding: const EdgeInsets.all(10),
          ),
          child: AnimatedCrossFade(
            firstChild: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: 20.0,
                color: AppColors.heartGreyColor,
              ),
            ),
            secondChild: const Center(
              child: FaIcon(
                FontAwesomeIcons.xmark,
                size: 20.0,
                color: AppColors.red,
              ),
            ),
            crossFadeState: getCrossFade(),
            duration: const Duration(milliseconds: 300),
          ),
        );
      },
    );
  }
}
