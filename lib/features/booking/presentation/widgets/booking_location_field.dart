import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/center_progress_indicator.dart';

import '../bloc/booking_bloc.dart';

class BookingLocationField extends StatefulWidget {
  const BookingLocationField({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  State<BookingLocationField> createState() => _BookingLocationFieldState();
}

class _BookingLocationFieldState extends State<BookingLocationField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listener: (context, state) {
        if (state is GetPlaceDetailsByLatLngSuccess) {
          controller.text = state.placeDetailsModel.formattedAddress;
        }
        if (state is GetPlaceDetailsSuccess) {
          controller.text = state.placeDetailsModel.formattedAddress;
        }
        if (state is LocationUpdated) {
          controller.text = state.location;
        }
      },
      builder: (context, state) {
        if (state is GetPlaceDetailsByLatLngLoading ||
            state is GetPlaceDetailsLoading) {
          return const CenterProgressIndicator();
        }
        return TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "الموقع الحالى",
            labelText: "الموقع الحالى",
          ),
          readOnly: true,
          onChanged: widget.onChanged,
        );
      },
    );
  }
}
