import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/extension.dart';
import '../bloc/reservation_bloc.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/widgets/custom_button.dart';

class AddReservationButton extends StatelessWidget {
  const AddReservationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'حجز الأن',
      textColor: AppColors.whiteColor,
      width: context.width,
      onPressed: () {
        context.read<ReservationBloc>().add(AddReservation());
      },
    );
  }
}
