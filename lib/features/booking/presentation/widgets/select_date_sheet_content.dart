import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import 'add_reservation_button.dart';
import 'booking_days_builder.dart';
import 'workday_hours_builder.dart';

class SelectDateSheetContent extends StatelessWidget {
  const SelectDateSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.selectDate,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        AppStrings.explain2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const CloseButton(),
                ],
              ),
            ),
            const BookingDaysBuilder(),
            const SizedBox(height: 15),
            const WorkDayHoursBuilder(),
            const SizedBox(height: 20),
            const AddReservationButton(),
          ],
        ),
      ),
    );
  }
}
