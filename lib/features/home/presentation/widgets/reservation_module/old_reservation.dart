import 'package:flutter/material.dart';

import '../../../data/models/reservation_model.dart';
import 'reservation_card.dart';

class OldReservation extends StatelessWidget {
  const OldReservation({super.key, required this.reservations});

  final List<ReservationModel> reservations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ReservationCard(
          reservationModel: reservations[index],
        );
      },
      itemCount: reservations.length,
    );
  }
}
