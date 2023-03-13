import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/functions/build_toast.dart';
import 'package:ghaslah/features/home/data/models/reservation_model.dart';

import '../../../../../core/functions/build_dialog_indicator.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../bloc/home_bloc.dart';
import 'new_booking.dart';
import 'old_booking.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetAllReservations());
  }

  List<ReservationModel> newReservations = [];
  List<ReservationModel> oldReservations = [];

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
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is GetAllReservationsSuccess) {
              // TODO : HANDLE RESERVATIONS TO OLD AND NEW
              newReservations = state.reservations;
              oldReservations = state.reservations;
              Navigator.pop(context);
            }
            if (state is GetAllReservationsFailed) {
              Navigator.pop(context);
              buildToast(toastType: ToastType.error, msg: state.message);
            }
            if (state is GetAllReservationsLoading) {
              buildCenterDialogIndicator(context);
            }
          },
          builder: (context, state) {
            return TabBarView(
              children: [
                OldBooking(reservations: newReservations),
                NewBooking(reservations: oldReservations),
              ],
            );
          },
        ),
      ),
    );
  }
}
