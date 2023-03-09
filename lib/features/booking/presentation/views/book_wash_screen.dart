import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/core/widgets/custom_button.dart';
import 'package:ghaslah/features/booking/presentation/widgets/add_car_button.dart';
import 'package:ghaslah/features/booking/presentation/widgets/select_date_sheet_content.dart';
import 'package:ghaslah/features/home/data/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/booking_bloc.dart';
import '../widgets/add_hint_field.dart';
import '../widgets/car_card.dart';
import '../widgets/location_button.dart';
import '../widgets/search_button.dart';

class BookingWashScreen extends StatelessWidget {
  const BookingWashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor.withOpacity(.6),
        title: Text(
          AppStrings.bookingDetails,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.whiteColor,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.chooseLocation,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 17,
                    ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  SearchButton(),
                  SizedBox(width: 10),
                  LocationButton(),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                AppStrings.selectCar,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 17,
                    ),
              ),
              Text(
                AppStrings.explain,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  AddCarButton(),
                  SizedBox(width: 10),
                  CarCard(
                    carModel: CarModel(
                      color: "#ff0889",
                      model: "بى ام",
                      id: "1",
                      cardSignNumbers: "7767-a b h",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const AddHintInputField(),
              const SizedBox(height: 40),
              CustomButton(
                text: AppStrings.next,
                textColor: AppColors.whiteColor,
                width: context.width,
                onPressed: () =>
                    bottomSheet(context, context.read<BookingBloc>()),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context, BookingBloc bloc) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.greyColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: DefaultTabController(
          length: 9,
          child: SelectDateSheetContent(),
        ),
      ),
    );
  }
}
