import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/functions/build_dialog_indicator.dart';
import '../../../../../core/helpers/location_helper.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../bloc/reservation_bloc.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            buildCenterDialogIndicator(context);
            final currentLocation = await LocationHelper.getCurrentLocation();
            if (context.mounted) {
              Navigator.pop(context);

              final sessiontoken = const Uuid().v4();
              context.read<ReservationBloc>().add(
                    GetPlaceDetailsByLatLng(
                      lat: currentLocation.latitude,
                      lng: currentLocation.longitude,
                      sessiontoken: sessiontoken,
                    ),
                  );
            }
          },
          child: Container(
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
        );
      },
    );
  }
}
