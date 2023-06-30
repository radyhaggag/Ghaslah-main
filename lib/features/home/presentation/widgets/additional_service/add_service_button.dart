import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/service_model.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../bloc/home_bloc.dart';

class AddServiceButton extends StatelessWidget {
  const AddServiceButton({super.key, required this.serviceModel});
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

        return AnimatedCrossFade(
          firstChild: _AddAdditionalService(serviceModel: serviceModel),
          secondChild: _RemoveAdditionalService(serviceModel: serviceModel),
          crossFadeState: getCrossFade(),
          duration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}

class _AddAdditionalService extends StatelessWidget {
  const _AddAdditionalService({required this.serviceModel});

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "اضافة الخدمة",
      width: context.width,
      onPressed: () {
        context
            .read<HomeBloc>()
            .add(AddAdditionalServiceForReservation(serviceModel));
      },
      textColor: AppColors.whiteColor,
      fontSize: 20,
    );
  }
}

class _RemoveAdditionalService extends StatelessWidget {
  const _RemoveAdditionalService({required this.serviceModel});

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "حذف الخدمة",
      width: context.width,
      onPressed: () {
        context
            .read<HomeBloc>()
            .add(RemoveAdditionalServiceForReservation(serviceModel));
      },
      textColor: AppColors.whiteColor,
      backgroundColor: AppColors.red,
      fontSize: 20,
    );
  }
}
