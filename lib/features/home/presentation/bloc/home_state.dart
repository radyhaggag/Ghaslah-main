part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomePageModuleChanged extends HomeState {
  final int index;

  const HomePageModuleChanged(this.index);

  @override
  List<Object> get props => [index];
}

class GetAllServicesLoading extends HomeState {}

class GetAllServicesFailed extends HomeState {
  final String message;

  const GetAllServicesFailed(this.message);
}

class GetAllServicesSuccess extends HomeState {
  final HomeServicesModel services;

  const GetAllServicesSuccess(this.services);
}

class GetServiceLoading extends HomeState {}

class GetServiceFailed extends HomeState {
  final String message;

  const GetServiceFailed(this.message);
}

class GetServiceSuccess extends HomeState {
  final ServiceModel service;

  const GetServiceSuccess(this.service);
}

class GetAllReservationsLoading extends HomeState {}

class GetAllReservationsFailed extends HomeState {
  final String message;

  const GetAllReservationsFailed(this.message);
}

class GetAllReservationsSuccess extends HomeState {
  final List<ReservationModel> reservations;

  const GetAllReservationsSuccess(this.reservations);
}

class AdditionalServiceForReservationAdded extends HomeState {
  final ServiceModel serviceModel;

  const AdditionalServiceForReservationAdded(this.serviceModel);

  @override
  List<Object?> get props => [serviceModel];
}

class AdditionalServiceForReservationRemoved extends HomeState {
  final ServiceModel serviceModel;

  const AdditionalServiceForReservationRemoved(this.serviceModel);

  @override
  List<Object?> get props => [serviceModel];
}

class MainServiceSelected extends HomeState {
  final ServiceModel serviceModel;

  const MainServiceSelected(this.serviceModel);

  @override
  List<Object?> get props => [serviceModel];
}

class MainServiceUnSelected extends HomeState {}
