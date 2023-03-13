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

class AdditionalServiceForBookingAdded extends BookingState {
  final ServiceModel serviceModel;

  const AdditionalServiceForBookingAdded(this.serviceModel);

  @override
  List<Object?> get props => [serviceModel];
}

class AdditionalServiceForBookingRemoved extends BookingState {
  final ServiceModel serviceModel;

  const AdditionalServiceForBookingRemoved(this.serviceModel);

  @override
  List<Object?> get props => [serviceModel];
}

class AddNewCarLoading extends BookingState {}

class AddNewCarFailed extends BookingState {
  final String message;

  const AddNewCarFailed(this.message);
}

class AddNewCarSuccess extends BookingState {
  final bool result;

  const AddNewCarSuccess(this.result);
}

class GetAllCarLoading extends BookingState {}

class GetAllCarFailed extends BookingState {
  final String message;

  const GetAllCarFailed(this.message);
}

class GetAllCarSuccess extends BookingState {
  final List<CarModel> cars;

  const GetAllCarSuccess(this.cars);
}

class GetAllWorkDaysLoading extends BookingState {}

class GetAllWorkDaysFailed extends BookingState {
  final String message;

  const GetAllWorkDaysFailed(this.message);
}

class GetAllWorkDaysSuccess extends BookingState {
  final List<WorkDayModel> workDays;

  const GetAllWorkDaysSuccess(this.workDays);
}

class GetWorkDayLoading extends BookingState {}

class GetWorkDayFailed extends BookingState {
  final String message;

  const GetWorkDayFailed(this.message);
}

class GetWorkDaySuccess extends BookingState {
  final WorkDayModel workDay;

  const GetWorkDaySuccess(this.workDay);
}

class GetCarLoading extends BookingState {}

class GetCarFailed extends BookingState {
  final String message;

  const GetCarFailed(this.message);
}

class GetCarSuccess extends BookingState {
  final CarModel car;

  const GetCarSuccess(this.car);
}

class AddReservationLoading extends BookingState {}

class AddReservationFailed extends BookingState {
  final String message;

  const AddReservationFailed(this.message);
}

class AddReservationSuccess extends BookingState {
  final bool result;

  const AddReservationSuccess(this.result);
}

class GetMapSuggestionsLoading extends BookingState {}

class GetMapSuggestionsSuccess extends BookingState {
  final List<PlaceSuggestionModel> suggestions;

  const GetMapSuggestionsSuccess(this.suggestions);

  @override
  List<Object?> get props => [suggestions];
}

class GetMapSuggestionsFailed extends BookingState {
  final String message;

  const GetMapSuggestionsFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class GetPlaceDetailsLoading extends BookingState {}

class GetPlaceDetailsSuccess extends BookingState {
  final PlaceDetailsModel placeDetailsModel;

  const GetPlaceDetailsSuccess(this.placeDetailsModel);

  @override
  List<Object?> get props => [placeDetailsModel];
}

class GetPlaceDetailsFailed extends BookingState {
  final String message;

  const GetPlaceDetailsFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class GetPlaceDetailsByLatLngSuccess extends BookingState {
  final PlaceDetailsModel placeDetailsModel;

  const GetPlaceDetailsByLatLngSuccess(this.placeDetailsModel);

  @override
  List<Object?> get props => [placeDetailsModel];
}

class GetPlaceDetailsByLatLngLoading extends BookingState {}

class LocationUpdated extends BookingState {
  final String location;

  const LocationUpdated(this.location);

  @override
  List<Object?> get props => [location];
}
