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
