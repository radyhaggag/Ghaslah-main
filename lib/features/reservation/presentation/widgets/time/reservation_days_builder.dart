import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../bloc/reservation_bloc.dart';

class ReservationDaysBuilder extends StatelessWidget {
  const ReservationDaysBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      buildWhen: (previous, current) {
        if (current is GetAllWorkDaysSuccess ||
            current is GetAllWorkDaysLoading) {
          return true;
        }
        if (current is GetAllWorkDaysFailed) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is GetAllWorkDaysSuccess) {
          return DatePicker(
            DateTime.now(),
            locale: 'ar',
            height: 150,
            width: 100,
            activeDates: state.workDays
                .map(
                  (e) => DateTime.parse(e.date),
                )
                .toList(),
            deactivatedColor: Colors.black.withOpacity(.3),
            selectedTextColor: Colors.white,
            selectionColor: AppColors.primaryColor.withOpacity(.7),
            onDateChange: (date) {
              final day = state.workDays.firstWhere(
                (element) => DateTime.parse(element.date).day == date.day,
              );
              context.read<ReservationBloc>().add(GetWorkDayById(day.id));
            },
          );
        } else if (state is GetAllWorkDaysLoading) {
          return const CenterProgressIndicator();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
