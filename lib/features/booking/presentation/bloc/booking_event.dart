part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object?> get props => [];
}

class ChangeBookingDate extends BookingEvent {
  final String? day;
  final String? hour;

  const ChangeBookingDate({this.day, this.hour});

  @override
  List<Object?> get props => [day, hour];
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
