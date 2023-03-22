part of 'reservation_bloc.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object?> get props => [];
}

class SelectReservationId extends ReservationEvent {
  final int serviceId;

  const SelectReservationId(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}

class ChangeReservationHour extends ReservationEvent {
  final int workHourId;

  const ChangeReservationHour(this.workHourId);

  @override
  List<Object?> get props => [workHourId];
}

class SelectReservationCar extends ReservationEvent {
  final CarModel carModel;

  const SelectReservationCar(this.carModel);

  @override
  List<Object?> get props => [carModel];
}

class AddNewCar extends ReservationEvent {
  final CarModel carModel;

  const AddNewCar(this.carModel);
}

class GetAllCars extends ReservationEvent {}

class GetAllWorkDays extends ReservationEvent {}

class GetWorkDayById extends ReservationEvent {
  final int id;

  const GetWorkDayById(this.id);
}

class GetCarById extends ReservationEvent {
  final int id;

  const GetCarById(this.id);
}

class AddReservation extends ReservationEvent {}

class GetMapSuggestions extends ReservationEvent {
  final String input;
  final String sessiontoken;

  const GetMapSuggestions({
    required this.input,
    required this.sessiontoken,
  });

  @override
  List<Object> get props => [input, sessiontoken];
}

class GetPlaceDetailsByPlaceId extends ReservationEvent {
  final String placeId;
  final String sessiontoken;

  const GetPlaceDetailsByPlaceId({
    required this.placeId,
    required this.sessiontoken,
  });

  @override
  List<Object> get props => [placeId, sessiontoken];
}

class GetPlaceDetailsByLatLng extends ReservationEvent {
  final double lat;
  final double lng;
  final String sessiontoken;

  const GetPlaceDetailsByLatLng({
    required this.lat,
    required this.lng,
    required this.sessiontoken,
  });

  @override
  List<Object> get props => [lat, lng, sessiontoken];
}

class ChangeReservationLocation extends ReservationEvent {
  final String location;

  const ChangeReservationLocation({
    required this.location,
  });

  @override
  List<Object> get props => [location];
}

class ChangeReservationServices extends ReservationEvent {
  final List<int> additionalServices;
  final int mainServiceId;

  const ChangeReservationServices({
    required this.additionalServices,
    required this.mainServiceId,
  });

  @override
  List<Object> get props => [additionalServices, mainServiceId];
}

class ChangePaidWay extends ReservationEvent {
  final String paymentMethod;

  const ChangePaidWay(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}
