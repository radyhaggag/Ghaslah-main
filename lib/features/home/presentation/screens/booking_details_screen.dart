import 'package:flutter/material.dart';
import '../../../../core/utils/extension.dart';
import '../../data/models/reservation_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/color_manager.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key, required this.reservationModel});

  final ReservationModel reservationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل الخدمة"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: NetworkImage(reservationModel.service.image),
              fit: BoxFit.cover,
              height: context.height / 4,
              width: context.width,
            ),
            Container(
              width: context.width,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: AppColors.greyColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        reservationModel.service.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${reservationModel.service.price} ريال",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: AppColors.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30, thickness: 3),
                  Text(
                    'وصف الخدمة',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 18.0,
                        ),
                  ),
                  Text(
                    reservationModel.service.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14,
                          color: Colors.black.withOpacity(.7),
                        ),
                  ),
                  const Text(
                    "الموقع",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    reservationModel.location,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                  const Text(
                    "تاريخ الخدمة",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat().format(DateTime.parse(reservationModel.date)),
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                  const Divider(height: 30, thickness: 3),
                  Row(
                    children: [
                      const Text(
                        "موديل السياراة",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        reservationModel.car.model,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: AppColors.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "لون السياراة",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        reservationModel.car.color,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: AppColors.mainTextColor,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30, thickness: 3),
                  Row(
                    children: [
                      Text(
                        'التكلفة النهائية',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 18.0,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        reservationModel.amount,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const Divider(height: 30, thickness: 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
