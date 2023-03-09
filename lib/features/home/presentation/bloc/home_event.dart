part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class ChangeHomePageModule extends HomeEvent {
  final int index;

  const ChangeHomePageModule(this.index);

  @override
  List<Object?> get props => [index];
}

class GetAllServices extends HomeEvent {}

class GetAllReservations extends HomeEvent {}

class GetReservationById extends HomeEvent {
  final int id;

  const GetReservationById(this.id);
}

class GetServiceById extends HomeEvent {
  final int id;

  const GetServiceById(this.id);
}
