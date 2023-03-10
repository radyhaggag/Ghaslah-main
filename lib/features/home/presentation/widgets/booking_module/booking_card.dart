import 'package:flutter/material.dart';
import 'package:ghaslah/features/home/data/models/reservation_model.dart';
import 'package:ghaslah/features/home/presentation/widgets/home_module/discount_card.dart';

import '../../../../../core/utils/color_manager.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    this.reservationModel,
  });

  final ReservationModel? reservationModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Image(
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.contain,
                  image: NetworkImage(
                      "https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg&w=872&h=578&q=75&c=1"),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "غسيل سيارة",
                        softWrap: true,
                        style: const TextStyle(
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${30} ريال",
                        softWrap: true,
                        style: const TextStyle(
                          color: AppColors.mainTextColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ],
            ), //
          ),
        ],
      ),
    );
  }
}
