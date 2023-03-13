part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object?> get props => [];
}

class SelectBookingId extends BookingEvent {
  final int serviceId;

  const SelectBookingId(this.serviceId);

  @override
  List<Object?> get props => [serviceId];
}

class ChangeBookingHour extends BookingEvent {
  final int workHourId;

  const ChangeBookingHour(this.workHourId);

  @override
  List<Object?> get props => [workHourId];
}

class SelectBookingCar extends BookingEvent {
  final CarModel carModel;

  const SelectBookingCar(this.carModel);

  @override
  List<Object?> get props => [carModel];
}

class AddAdditionalServiceForBooking extends BookingEvent {
  final ServiceModel serviceModel;

  const AddAdditionalServiceForBooking(this.serviceModel);

  @override
  List<Object?> get props => [serviceModel];
}

class RemoveAdditionalServiceForBooking extends BookingEvent {
  final ServiceModel serviceModel;

  const RemoveAdditionalServiceForBooking(this.serviceModel);

  @override
  List<Object?> get props => [serviceModel];
}

class AddNewCar extends BookingEvent {
  final CarModel carModel;

  const AddNewCar(this.carModel);
}

class GetAllCars extends BookingEvent {}

class GetAllWorkDays extends BookingEvent {}

class GetWorkDayById extends BookingEvent {
  final int id;

  const GetWorkDayById(this.id);
}

class GetCarById extends BookingEvent {
  final int id;

  const GetCarById(this.id);
}

class AddReservation extends BookingEvent {}

class GetMapSuggestions extends BookingEvent {
  final String input;
  final String sessiontoken;

  const GetMapSuggestions({
    required this.input,
    required this.sessiontoken,
  });

  @override
  List<Object> get props => [input, sessiontoken];
}

class GetPlaceDetailsByPlaceId extends BookingEvent {
  final String placeId;
  final String sessiontoken;

  const GetPlaceDetailsByPlaceId({
    required this.placeId,
    required this.sessiontoken,
  });

  @override
  List<Object> get props => [placeId, sessiontoken];
}

class GetPlaceDetailsByLatLng extends BookingEvent {
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

class ChangeBookingLocation extends BookingEvent {
  final String location;

  const ChangeBookingLocation({
    required this.location,
  });

  @override
  List<Object> get props => [location];
}
