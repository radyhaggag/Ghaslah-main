import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/booking_bloc.dart';

class SelectDateSheetContent extends StatelessWidget {
  SelectDateSheetContent({super.key});

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
            DatePicker(
              DateTime.now(),
              locale: 'ar',
              height: 150,
              width: 100,
              deactivatedColor: Colors.black.withOpacity(.7),
              selectedTextColor: Colors.white,
              selectionColor: AppColors.primaryColor.withOpacity(.7),
              onDateChange: (date) {
                context.read<BookingBloc>().add(
                      ChangeBookingDate(day: date.day.toString()),
                    );
              },
            ),
            const SizedBox(height: 15),
            TabBar(
              isScrollable: true,
              labelColor: AppColors.mainTextColor,
              tabs: _availableHours.map((hour) => Tab(text: hour)).toList(),
              onTap: (index) {
                context.read<BookingBloc>().add(
                      ChangeBookingDate(hour: _availableHours[index]),
                    );
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: AppStrings.next,
              textColor: AppColors.whiteColor,
              width: context.width,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  final List<String> _availableHours = [
    '3:15 PM',
    '4:15 PM',
    '4:30 PM',
    '2:00 PM',
    '11:30 AM',
    '3:15 PM',
    '3:15 PM',
    '3:15 PM',
    '3:15 PM',
  ];
}
