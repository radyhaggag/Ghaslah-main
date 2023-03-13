import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/functions/build_dialog_indicator.dart';
import 'package:ghaslah/core/functions/build_toast.dart';
import 'package:ghaslah/features/booking/presentation/widgets/cars_builder.dart';
import 'package:ghaslah/features/booking/presentation/widgets/booking_location_field.dart';
import 'package:ghaslah/features/home/data/models/service_model.dart';
import '../../../../core/functions/show_location_dialog.dart';
import '../../../../core/helpers/location_helper.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/widgets/custom_button.dart';
import '../widgets/add_car_button.dart';
import '../widgets/select_date_sheet_content.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/booking_bloc.dart';
import '../widgets/add_hint_field.dart';
import '../widgets/location_button.dart';
import '../widgets/search_button.dart';

class BookingWashScreen extends StatefulWidget {
  const BookingWashScreen({
    Key? key,
    required this.serviceModel,
  }) : super(key: key);
  final ServiceModel serviceModel;

  @override
  State<BookingWashScreen> createState() => _BookingWashScreenState();
}

class _BookingWashScreenState extends State<BookingWashScreen> {
  _checkPermissions() async {
    await LocationHelper.checkPermission().then((result) {
      if (!result) {
        LocationHelper.requestPermission().then((value) {
          if (!value) showLocationDialog(context);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkPermissions();
    context.read<BookingBloc>().add(SelectBookingId(widget.serviceModel.id));
    context.read<BookingBloc>().add(GetAllCars());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is GetAllCarFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is GetAllWorkDaysFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is GetWorkDayFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is AddReservationFailed) {
          Navigator.pop(context);
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is AddReservationLoading) {
          buildCenterDialogIndicator(context);
        }
        if (state is AddReservationSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          buildToast(
            toastType: ToastType.success,
            msg: "تم اضافة حجزك بنجاح",
          );
        }
        if (state is AddNewCarFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
        if (state is AddNewCarSuccess) {
          buildToast(
            toastType: ToastType.success,
            msg: "تم أضافة سياراتك بنجاح",
          );
          context.read<BookingBloc>().add(GetAllCars());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
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
                const SizedBox(height: 20),
                const BookingLocationField(),
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
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      AddCarButton(),
                      SizedBox(width: 10),
                      CarsBuilder(),
                    ],
                  ),
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
        value: bloc..add(GetAllWorkDays()),
        child: const SelectDateSheetContent(),
      ),
    );
  }
}
