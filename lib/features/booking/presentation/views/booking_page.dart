import 'package:flutter/material.dart';

import '../../../../core/utils/color_manager.dart';
import '../widgets/new_booking.dart';
import '../widgets/old_booking.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: const Text('الحجوزات'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "الحالية"),
              Tab(text: "المكتملة"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OldBooking(),
            NewBooking(),
          ],
        ),
      ),
    );
  }
}
