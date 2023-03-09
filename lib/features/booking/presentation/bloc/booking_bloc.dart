import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghaslah/features/booking/data/services/booking_services.dart';
import 'package:ghaslah/features/home/data/models/work_day_model.dart';
import '../../data/models/book_model.dart';
import '../../../home/data/models/car_model.dart';

import '../../../home/data/models/service_model.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingServices bookingServices;
  BookingBloc(this.bookingServices) : super(BookingInitial()) {
    on<ChangeBookingDate>(_changeBookingDate);
    on<SelectBookingCar>(_selectBookingCar);
    on<AddAdditionalServiceForBooking>(_addAdditionalServiceForBooking);
    on<RemoveAdditionalServiceForBooking>(_removeAdditionalServiceForBooking);
    on<AddNewCar>(_addNewCar);
    on<GetAllCars>(_getAllCars);
    on<GetAllWorkDays>(_getAllWorkDays);
    on<GetWorkDayById>(_getWorkDayById);
    on<GetCarById>(_getCarById);
  }

  BookModel bookModel = BookModel(additionalServices: []);

  _changeBookingDate(ChangeBookingDate event, Emitter<BookingState> emit) {
    bookModel = bookModel.copyWith(
      day: event.day,
      hour: event.hour,
    );
  }

  _selectBookingCar(
    SelectBookingCar event,
    Emitter<BookingState> emit,
  ) {
    bookModel = bookModel.copyWith(car: event.carModel);
    emit(BookingCarSelected(bookModel.car!));
  }

  _addAdditionalServiceForBooking(
    AddAdditionalServiceForBooking event,
    Emitter<BookingState> emit,
  ) {
    bookModel.additionalServices?.add(event.serviceModel);
    emit(AdditionalServiceForBookingAdded(event.serviceModel));
  }

  _removeAdditionalServiceForBooking(
    RemoveAdditionalServiceForBooking event,
    Emitter<BookingState> emit,
  ) {
    bookModel.additionalServices?.remove(event.serviceModel);
    emit(AdditionalServiceForBookingRemoved(event.serviceModel));
  }

  Future<void> _addNewCar(
    AddNewCar event,
    Emitter<BookingState> emit,
  ) async {
    emit(AddNewCarLoading());
    final res = await bookingServices.addCar(event.carModel);
    res.fold(
      (failure) => emit(AddNewCarFailed(failure.message)),
      (result) => emit(AddNewCarSuccess(result)),
    );
  }

  Future<void> _getAllCars(
    GetAllCars event,
    Emitter<BookingState> emit,
  ) async {
    emit(GetAllCarLoading());
    final res = await bookingServices.getCars();
    res.fold(
      (failure) => emit(GetAllCarFailed(failure.message)),
      (result) => emit(GetAllCarSuccess(result)),
    );
  }

  Future<void> _getAllWorkDays(
    GetAllWorkDays event,
    Emitter<BookingState> emit,
  ) async {
    emit(GetAllCarLoading());
    final res = await bookingServices.getWorkDays();
    res.fold(
      (failure) => emit(GetAllWorkDaysFailed(failure.message)),
      (result) => emit(GetAllWorkDaysSuccess(result)),
    );
  }

  Future<void> _getWorkDayById(
    GetWorkDayById event,
    Emitter<BookingState> emit,
  ) async {
    emit(GetWorkDayLoading());
    final res = await bookingServices.getWorkDayById(event.id);
    res.fold(
      (failure) => emit(GetWorkDayFailed(failure.message)),
      (result) => emit(GetWorkDaySuccess(result)),
    );
  }

  Future<void> _getCarById(
    GetCarById event,
    Emitter<BookingState> emit,
  ) async {
    emit(GetCarLoading());
    final res = await bookingServices.getCarById(event.id);
    res.fold(
      (failure) => emit(GetCarFailed(failure.message)),
      (result) => emit(GetCarSuccess(result)),
    );
  }
}
