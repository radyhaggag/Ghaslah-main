import 'package:flutter/material.dart';
import 'package:ghaslah/features/home/data/models/reservation_model.dart';

import 'booking_card.dart';

class NewBooking extends StatelessWidget {
  const NewBooking({super.key, required this.reservations});

  final List<ReservationModel> reservations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const BookingCard();
      },
      itemCount: 10,
    );
  }
}
