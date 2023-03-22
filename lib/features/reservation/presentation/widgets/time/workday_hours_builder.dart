import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../bloc/reservation_bloc.dart';

class WorkDayHoursBuilder extends StatelessWidget {
  const WorkDayHoursBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
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
          if (state.workDay.workHours!.isEmpty) {
            return Text(
              "لا يوجد ساعات عمل متاحة فى هذا اليوم.",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            );
          }
          return DefaultTabController(
            length: state.workDay.workHours!.length,
            child: TabBar(
              isScrollable: true,
              labelColor: AppColors.mainTextColor,
              tabs: state.workDay.workHours!
                  .map((hour) => Tab(text: hour.hour))
                  .toList(),
              onTap: (index) {
                context.read<ReservationBloc>().add(
                      ChangeReservationHour(state.workDay.workHours![index].id),
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
