import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';

import '../../bloc/reservation_bloc.dart';

class ReservationLocationField extends StatefulWidget {
  const ReservationLocationField({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  State<ReservationLocationField> createState() =>
      _ReservationLocationFieldState();
}

class _ReservationLocationFieldState extends State<ReservationLocationField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: context.read<ReservationBloc>().bookModel.location,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReservationBloc, ReservationState>(
      listener: (context, state) {
        if (state is GetPlaceDetailsByLatLngSuccess) {
          controller.text = state.placeDetailsModel.formattedAddress;
        }
        if (state is GetPlaceDetailsSuccess) {
          controller.text = state.placeDetailsModel.formattedAddress;
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
          onChanged: widget.onChanged,
        );
      },
    );
  }
}
