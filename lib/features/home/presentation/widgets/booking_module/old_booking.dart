import 'package:flutter/material.dart';

import '../../../data/models/reservation_model.dart';
import 'booking_card.dart';

class OldBooking extends StatelessWidget {
  const OldBooking({super.key, required this.reservations});

  final List<ReservationModel> reservations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return BookingCard(
          reservationModel: reservations[index],
        );
      },
      itemCount: reservations.length,
    );
  }
}
