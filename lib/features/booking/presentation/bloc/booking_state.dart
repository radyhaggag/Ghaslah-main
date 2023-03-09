part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object?> get props => [];
}

class BookingInitial extends BookingState {}

class BookingCarSelected extends BookingState {
  final CarModel carModel;

  const BookingCarSelected(this.carModel);

  @override
  List<Object?> get props => [carModel];
}
