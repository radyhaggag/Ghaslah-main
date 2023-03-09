import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/widgets/center_progress_indicator.dart';
import '../bloc/booking_bloc.dart';

class WorkDayHoursBuilder extends StatelessWidget {
  const WorkDayHoursBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      buildWhen: (previous, current) {
        if (current is GetWorkDaySuccess || current is GetWorkDayLoading) {
          return true;
        }
        if (current is GetWorkDayFailed) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is GetWorkDaySuccess) {
          return DefaultTabController(
            length: state.workDay.workHours!.length,
            child: TabBar(
              isScrollable: true,
              labelColor: AppColors.mainTextColor,
              tabs: state.workDay.workHours!
                  .map((hour) => Tab(text: hour.hour))
                  .toList(),
              onTap: (index) {
                context.read<BookingBloc>().add(
                      ChangeBookingHour(state.workDay.workHours![index].id),
                    );
              },
            ),
          );
        } else if (state is GetWorkDayLoading) {
          return const CenterProgressIndicator();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
