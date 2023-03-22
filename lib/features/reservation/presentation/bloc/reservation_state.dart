part of 'reservation_bloc.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();

  @override
  List<Object?> get props => [];
}

class ReservationInitial extends ReservationState {}

class ReservationCarSelected extends ReservationState {
  final CarModel carModel;

  const ReservationCarSelected(this.carModel);

  @override
  List<Object?> get props => [carModel];
}

class AddNewCarLoading extends ReservationState {}

class AddNewCarFailed extends ReservationState {
  final String message;

  const AddNewCarFailed(this.message);
}

class AddNewCarSuccess extends ReservationState {
  final bool result;

  const AddNewCarSuccess(this.result);
}

class GetAllCarLoading extends ReservationState {}

class GetAllCarFailed extends ReservationState {
  final String message;

  const GetAllCarFailed(this.message);
}

class ReservationServicesUpdated extends ReservationState {}

class GetAllCarSuccess extends ReservationState {
  final List<CarModel> cars;

  const GetAllCarSuccess(this.cars);
}

class GetAllWorkDaysLoading extends ReservationState {}

class GetAllWorkDaysFailed extends ReservationState {
  final String message;

  const GetAllWorkDaysFailed(this.message);
}

class GetAllWorkDaysSuccess extends ReservationState {
  final List<WorkDayModel> workDays;

  const GetAllWorkDaysSuccess(this.workDays);
}

class GetWorkDayLoading extends ReservationState {}

class GetWorkDayFailed extends ReservationState {
  final String message;

  const GetWorkDayFailed(this.message);
}

class GetWorkDaySuccess extends ReservationState {
  final WorkDayModel workDay;

  const GetWorkDaySuccess(this.workDay);
}

class GetCarLoading extends ReservationState {}

class GetCarFailed extends ReservationState {
  final String message;

  const GetCarFailed(this.message);
}

class GetCarSuccess extends ReservationState {
  final CarModel car;

  const GetCarSuccess(this.car);
}

class AddReservationLoading extends ReservationState {}

class AddReservationFailed extends ReservationState {
  final String message;

  const AddReservationFailed(this.message);
}

class AddReservationSuccess extends ReservationState {
  final bool result;

  const AddReservationSuccess(this.result);
}

class GetMapSuggestionsLoading extends ReservationState {}

class GetMapSuggestionsSuccess extends ReservationState {
  final List<PlaceSuggestionModel> suggestions;

  const GetMapSuggestionsSuccess(this.suggestions);

  @override
  List<Object?> get props => [suggestions];
}

class GetMapSuggestionsFailed extends ReservationState {
  final String message;

  const GetMapSuggestionsFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class GetPlaceDetailsLoading extends ReservationState {}

class GetPlaceDetailsSuccess extends ReservationState {
  final PlaceDetailsModel placeDetailsModel;

  const GetPlaceDetailsSuccess(this.placeDetailsModel);

  @override
  List<Object?> get props => [placeDetailsModel];
}

class GetPlaceDetailsFailed extends ReservationState {
  final String message;

  const GetPlaceDetailsFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class GetPlaceDetailsByLatLngSuccess extends ReservationState {
  final PlaceDetailsModel placeDetailsModel;

  const GetPlaceDetailsByLatLngSuccess(this.placeDetailsModel);

  @override
  List<Object?> get props => [placeDetailsModel];
}

class GetPlaceDetailsByLatLngLoading extends ReservationState {}

class LocationUpdated extends ReservationState {
  final String location;

  const LocationUpdated(this.location);

  @override
  List<Object?> get props => [location];
}

class PaidWayChanged extends ReservationState {
  final String paidWay;

  const PaidWayChanged(this.paidWay);

  @override
  List<Object> get props => [paidWay];
}
