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

class ChangeBookingLocation extends BookingEvent {
  final String location;

  const ChangeBookingLocation(this.location);

  @override
  List<Object?> get props => [location];
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
