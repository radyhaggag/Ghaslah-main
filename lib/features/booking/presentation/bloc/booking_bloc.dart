import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghaslah/features/booking/data/models/book_model.dart';
import 'package:ghaslah/features/home/data/models/car_model.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<ChangeBookingDate>(_changeBookingDate);
    on<SelectBookingCar>(_selectBookingCar);
  }

  BookModel _bookModel = BookModel();

  _changeBookingDate(ChangeBookingDate event, Emitter<BookingState> emit) {
    _bookModel = _bookModel.copyWith(
      day: event.day,
      hour: event.hour,
    );
  }

  _selectBookingCar(
    SelectBookingCar event,
    Emitter<BookingState> emit,
  ) {
    _bookModel = _bookModel.copyWith(car: event.carModel);
    emit(BookingCarSelected(_bookModel.car!));
  }
}
