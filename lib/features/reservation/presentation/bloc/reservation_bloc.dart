import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/book_model.dart';
import '../../data/models/car_model.dart';
import '../../data/models/place_details_model.dart';
import '../../data/models/place_suggestion_model.dart';
import '../../data/models/work_day_model.dart';
import '../../data/services/booking_services.dart';
import '../../data/services/maps_services.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final ReservationServices reservationServices;
  final MapsServices mapsServices;
  ReservationBloc(
    this.reservationServices,
    this.mapsServices,
  ) : super(ReservationInitial()) {
    on<ChangeReservationHour>(_changeReservationHour);
    on<SelectReservationCar>(_selectReservationCar);
    on<AddNewCar>(_addNewCar);
    on<GetAllCars>(_getAllCars);
    on<GetAllWorkDays>(_getAllWorkDays);
    on<GetWorkDayById>(_getWorkDayById);
    on<GetCarById>(_getCarById);
    on<SelectReservationId>(_selectReservationId);
    on<AddReservation>(_addReservation);
    on<GetMapSuggestions>(_getMapSuggestions);
    on<GetPlaceDetailsByPlaceId>(_getPlaceDetailsByPlaceId);
    on<GetPlaceDetailsByLatLng>(_getPlaceDetailsByLatLng);
    on<ChangeReservationLocation>(_changeReservationLocation);
    on<ChangeReservationServices>(_changeReservationServices);
    on<ChangePaidWay>(_changePaidWay);
  }

  BookModel bookModel = const BookModel(
    additionalServices: [],
    paymentMethod: 'رصيد',
  );

  _changeReservationHour(
      ChangeReservationHour event, Emitter<ReservationState> emit) {
    bookModel = bookModel.copyWith(workHourId: event.workHourId);
  }

  _selectReservationCar(
    SelectReservationCar event,
    Emitter<ReservationState> emit,
  ) {
    bookModel = bookModel.copyWith(carId: event.carModel.id);
    emit(ReservationCarSelected(event.carModel));
  }

  Future<void> _addNewCar(
    AddNewCar event,
    Emitter<ReservationState> emit,
  ) async {
    emit(AddNewCarLoading());
    final res = await reservationServices.addCar(event.carModel);
    res.fold(
      (failure) => emit(AddNewCarFailed(failure.message)),
      (result) => emit(AddNewCarSuccess(result)),
    );
  }

  Future<void> _getAllCars(
    GetAllCars event,
    Emitter<ReservationState> emit,
  ) async {
    emit(GetAllCarLoading());
    final res = await reservationServices.getCars();
    res.fold(
      (failure) => emit(GetAllCarFailed(failure.message)),
      (result) => emit(GetAllCarSuccess(result)),
    );
  }

  Future<void> _getAllWorkDays(
    GetAllWorkDays event,
    Emitter<ReservationState> emit,
  ) async {
    emit(GetAllWorkDaysLoading());
    final res = await reservationServices.getWorkDays();
    res.fold(
      (failure) => emit(GetAllWorkDaysFailed(failure.message)),
      (result) => emit(GetAllWorkDaysSuccess(result)),
    );
  }

  Future<void> _getWorkDayById(
    GetWorkDayById event,
    Emitter<ReservationState> emit,
  ) async {
    emit(GetWorkDayLoading());
    final res = await reservationServices.getWorkDayById(event.id);
    res.fold(
      (failure) => emit(GetWorkDayFailed(failure.message)),
      (result) => emit(GetWorkDaySuccess(result)),
    );
  }

  Future<void> _getCarById(
    GetCarById event,
    Emitter<ReservationState> emit,
  ) async {
    emit(GetCarLoading());
    final res = await reservationServices.getCarById(event.id);
    res.fold(
      (failure) => emit(GetCarFailed(failure.message)),
      (result) => emit(GetCarSuccess(result)),
    );
  }

  _selectReservationId(
      SelectReservationId event, Emitter<ReservationState> emit) {
    bookModel = bookModel.copyWith(serviceId: event.serviceId);
  }

  Future<void> _addReservation(
    AddReservation event,
    Emitter<ReservationState> emit,
  ) async {
    emit(AddReservationLoading());

    final res = await reservationServices.addReservation(bookModel);
    res.fold(
      (failure) => emit(AddReservationFailed(failure.message)),
      (result) => emit(AddReservationSuccess(result)),
    );
  }

  Future<void> _getMapSuggestions(
    GetMapSuggestions event,
    Emitter<ReservationState> emit,
  ) async {
    emit(GetMapSuggestionsLoading());

    final res = await mapsServices.getSuggestions(
      event.input,
      event.sessiontoken,
    );
    res.fold(
      (failure) => emit(GetMapSuggestionsFailed(failure.message)),
      (result) => emit(GetMapSuggestionsSuccess(result)),
    );
  }

  Future<void> _getPlaceDetailsByPlaceId(
    GetPlaceDetailsByPlaceId event,
    Emitter<ReservationState> emit,
  ) async {
    emit(GetPlaceDetailsLoading());

    final res = await mapsServices.getPlaceDetailsByPlaceId(
      event.placeId,
      event.sessiontoken,
    );
    res.fold(
      (failure) => emit(GetPlaceDetailsFailed(failure.message)),
      (result) => emit(GetPlaceDetailsSuccess(result)),
    );
  }

  Future<void> _getPlaceDetailsByLatLng(
    GetPlaceDetailsByLatLng event,
    Emitter<ReservationState> emit,
  ) async {
    emit(GetPlaceDetailsByLatLngLoading());

    final res = await mapsServices.getPlaceDetailsByLatLng(
      lat: event.lat,
      lng: event.lng,
      sessiontoken: event.sessiontoken,
    );
    res.fold(
      (failure) => emit(GetPlaceDetailsFailed(failure.message)),
      (result) {
        bookModel = bookModel.copyWith(
          location: result.formattedAddress,
        );
        emit(GetPlaceDetailsByLatLngSuccess(result));
      },
    );
  }

  _changeReservationLocation(
    ChangeReservationLocation event,
    Emitter<ReservationState> emit,
  ) {
    bookModel = bookModel.copyWith(location: event.location);
    emit(LocationUpdated(event.location));
  }

  _changeReservationServices(
    ChangeReservationServices event,
    Emitter<ReservationState> emit,
  ) {
    bookModel = bookModel.copyWith(
      serviceId: event.mainServiceId,
      additionalServices: event.additionalServices,
    );

    emit(ReservationServicesUpdated());
  }

  _changePaidWay(ChangePaidWay event, Emitter<ReservationState> emit) {
    bookModel = bookModel.copyWith(
      paymentMethod: event.paymentMethod,
    );

    emit(PaidWayChanged(event.paymentMethod));
  }
}
