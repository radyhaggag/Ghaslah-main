import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../booking/presentation/views/booking_page.dart';
import '../../../car_store/presentation/views/car_store_page.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ChangeHomePageModule>(_changeHomePageModule);
  }

  int selectedIndex = 0;

  final pages = <Widget>[
    const CarStorePage(),
    const BookingPage(),
  ];

  FutureOr<void> _changeHomePageModule(
    ChangeHomePageModule event,
    Emitter<HomeState> emit,
  ) {
    selectedIndex = event.index;
    emit(HomePageModuleChanged(selectedIndex));
  }
}
