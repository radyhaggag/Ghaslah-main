import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ghaslah/features/home/data/models/reservation_model.dart';
import 'package:ghaslah/features/home/data/models/service_model.dart';
import 'package:ghaslah/features/home/data/services/home_services.dart';

import '../../../booking/presentation/views/booking_page.dart';
import '../widgets/home_module/home_module_view.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeServices homeServices;
  HomeBloc(this.homeServices) : super(HomeInitial()) {
    on<ChangeHomePageModule>(_changeHomePageModule);
    on<GetAllServices>(_getAllServices);
    on<GetAllReservations>(_getAllReservations);
    on<GetServiceById>(_getServiceById);
  }

  int selectedIndex = 0;

  final pages = <Widget>[
    const HomeModuleView(),
    const BookingPage(),
  ];

  _changeHomePageModule(
    ChangeHomePageModule event,
    Emitter<HomeState> emit,
  ) {
    selectedIndex = event.index;
    emit(HomePageModuleChanged(selectedIndex));
  }

  Future<void> _getAllServices(
    GetAllServices event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetAllServicesLoading());
    final res = await homeServices.getServices();
    res.fold(
      (failure) => emit(GetAllServicesFailed(failure.message)),
      (result) => emit(GetAllServicesSuccess(result)),
    );
  }

  Future<void> _getAllReservations(
    GetAllReservations event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetAllReservationsLoading());
    final res = await homeServices.getReservations();
    res.fold(
      (failure) => emit(GetAllReservationsFailed(failure.message)),
      (result) => emit(GetAllReservationsSuccess(result)),
    );
  }

  Future<void> _getServiceById(
    GetServiceById event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetServiceLoading());
    final res = await homeServices.getServiceById(event.id);
    res.fold(
      (failure) => emit(GetServiceFailed(failure.message)),
      (result) => emit(GetServiceSuccess(result)),
    );
  }
}
