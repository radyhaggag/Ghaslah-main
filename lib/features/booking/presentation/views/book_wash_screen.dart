import 'package:ghaslah/core/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/strings_manager.dart';

class BookingWashScreen extends StatefulWidget {
  const BookingWashScreen({Key? key}) : super(key: key);

  @override
  State<BookingWashScreen> createState() => _BookingWashScreenState();
}

class _BookingWashScreenState extends State<BookingWashScreen> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      appBar: AppBar(
        elevation: 0,
        bottom: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.bookingDetails,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.chooseLocation,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          AppStrings.search,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.mapLocationDot,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          AppStrings.currentLocation,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                AppStrings.selectCar,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                AppStrings.explain,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 79,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.car,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          AppStrings.addVehicle,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.car,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'ت ه و',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '7767-a b h',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              TextFormField(
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  labelText: AppStrings.setNotice,
                  hintText: AppStrings.setNotice,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: AppStrings.next,
                onPressed: () {
                  bottomSheet(context);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.greyColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      builder: (context) => DefaultTabController(
        length: 9,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  AppStrings.selectDate,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.explain2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          FontAwesomeIcons.xmark,
                        )),
                  ],
                ),
                // DatePicker(
                //   DateTime.now(),
                //   initialSelectedDate: DateTime.now(),
                //   locale: 'ar',
                //   height: 100,
                //   activeDates: [
                //     DateTime(2023, 02, 21),
                //     DateTime(2023, 02, 22),
                //     DateTime(2023, 02, 23),
                //     DateTime(2023, 02, 24),
                //     DateTime(2023, 02, 25),
                //     DateTime(2023, 02, 26),
                //     DateTime(2023, 02, 27),
                //     DateTime(2023, 02, 28),
                //   ],
                //   selectionColor: Colors.black,
                //   selectedTextColor: Colors.white,
                //   onDateChange: (date) {
                //     // New date selected
                //     // setState(() {
                //     //   _selectedValue = date;
                //     // });
                //   },
                // ),

                SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  maxDate: DateTime(2023, 02, 28),
                  minDate: DateTime(2023, 02, 21),
                ),
                const TabBar(
                  isScrollable: true,
                  labelColor: AppColors.mainTextColor,
                  tabs: [
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '4:15 PM',
                    ),
                    Tab(
                      text: '4:30 PM',
                    ),
                    Tab(
                      text: '2:00 PM',
                    ),
                    Tab(
                      text: '11:30 AM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const CustomButton(
                  text: AppStrings.next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
