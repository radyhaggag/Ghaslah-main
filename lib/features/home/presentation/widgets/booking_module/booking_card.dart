import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../config/routes_manager.dart';
import '../../../data/models/reservation_model.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/color_manager.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.reservationModel,
  });

  final ReservationModel reservationModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.bookingDetails,
          arguments: reservationModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                      imageUrl: reservationModel.service.image,
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reservationModel.service.name,
                          softWrap: true,
                          style: const TextStyle(
                            color: AppColors.mainTextColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          reservationModel.service.description,
                          style: const TextStyle(
                            color: AppColors.secondTextColor,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "${reservationModel.amount} ريال",
                          softWrap: true,
                          style: const TextStyle(
                            color: AppColors.mainTextColor,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          DateFormat()
                              .format(DateTime.parse(reservationModel.date)),
                          style: const TextStyle(
                            color: AppColors.mainTextColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _getIcon(reservationModel.status),
                ],
              ), //
            ),
          ],
        ),
      ),
    );
  }

  _getIcon(String status) {
    if (status == "في الانتظار") {
      return const Icon(
        Icons.schedule,
        color: AppColors.primaryColor,
      );
    } else {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    }
  }
}
