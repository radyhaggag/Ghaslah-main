import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghaslah/features/booking/data/services/booking_services.dart';
import '../../data/models/book_model.dart';

import '../../../home/data/models/service_model.dart';
import '../../data/models/car_model.dart';
import '../../data/models/work_day_model.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingServices bookingServices;
  BookingBloc(this.bookingServices) : super(BookingInitial()) {
    on<ChangeBookingHour>(_changeBookingHour);
    on<SelectBookingCar>(_selectBookingCar);
    on<AddAdditionalServiceForBooking>(_addAdditionalServiceForBooking);
    on<RemoveAdditionalServiceForBooking>(_removeAdditionalServiceForBooking);
    on<AddNewCar>(_addNewCar);
    on<GetAllCars>(_getAllCars);
    on<GetAllWorkDays>(_getAllWorkDays);
    on<GetWorkDayById>(_getWorkDayById);
    on<GetCarById>(_getCarById);
    on<SelectBookingId>(_selectBookingId);
    on<AddReservation>(_addReservation);
  }

  BookModel bookModel = const BookModel(
    location: 'بنى سويف',
    additionalServices: [],
  );

  _addAdditionalServiceForBooking(
    AddAdditionalServiceForBooking event,
    Emitter<BookingState> emit,
  ) {
    bookModel = bookModel.copyWith(
      additionalServices: List.from(bookModel.additionalServices)
        ..add(event.serviceModel.id),
    );
    emit(AdditionalServiceForBookingAdded(event.serviceModel));
  }

  _removeAdditionalServiceForBooking(
    RemoveAdditionalServiceForBooking event,
    Emitter<BookingState> emit,
  ) {
    bookModel = bookModel.copyWith(
      additionalServices: List.from(bookModel.additionalServices)
        ..remove(event.serviceModel.id),
    );
    emit(AdditionalServiceForBookingRemoved(event.serviceModel));
  }

  _changeBookingHour(ChangeBookingHour event, Emitter<BookingState> emit) {
    bookModel = bookModel.copyWith(workHourId: event.workHourId);
  }

  _selectBookingCar(
    SelectBookingCar event,
    Emitter<BookingState> emit,
  ) {
    bookModel = bookModel.copyWith(carId: event.carModel.id);
    emit(BookingCarSelected(event.carModel));
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
    emit(GetAllWorkDaysLoading());
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

  _selectBookingId(SelectBookingId event, Emitter<BookingState> emit) {
    bookModel = bookModel.copyWith(serviceId: event.serviceId);
  }

  Future<void> _addReservation(
    AddReservation event,
    Emitter<BookingState> emit,
  ) async {
    emit(AddReservationLoading());
    final res = await bookingServices.addReservation(bookModel);
    res.fold(
      (failure) => emit(AddReservationFailed(failure.message)),
      (result) => emit(AddReservationSuccess(result)),
    );
  }
}
