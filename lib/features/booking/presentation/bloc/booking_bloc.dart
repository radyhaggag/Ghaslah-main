import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghaslah/features/booking/data/services/booking_services.dart';
import '../../data/models/book_model.dart';
import '../../../home/data/models/car_model.dart';

import '../../../home/data/models/service_model.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingServices bookingServices;
  BookingBloc(this.bookingServices) : super(BookingInitial()) {
    on<ChangeBookingDate>(_changeBookingDate);
    on<SelectBookingCar>(_selectBookingCar);
    on<AddAdditionalServiceForBooking>(_addAdditionalServiceForBooking);
    on<RemoveAdditionalServiceForBooking>(_removeAdditionalServiceForBooking);
  }

  BookModel bookModel = BookModel(additionalServices: []);

  _changeBookingDate(ChangeBookingDate event, Emitter<BookingState> emit) {
    bookModel = bookModel.copyWith(
      day: event.day,
      hour: event.hour,
    );
  }

  _selectBookingCar(
    SelectBookingCar event,
    Emitter<BookingState> emit,
  ) {
    bookModel = bookModel.copyWith(car: event.carModel);
    emit(BookingCarSelected(bookModel.car!));
  }

  _addAdditionalServiceForBooking(
    AddAdditionalServiceForBooking event,
    Emitter<BookingState> emit,
  ) {
    bookModel.additionalServices?.add(event.serviceModel);
    emit(AdditionalServiceForBookingAdded(event.serviceModel));
  }

  _removeAdditionalServiceForBooking(
    RemoveAdditionalServiceForBooking event,
    Emitter<BookingState> emit,
  ) {
    bookModel.additionalServices?.remove(event.serviceModel);
    emit(AdditionalServiceForBookingRemoved(event.serviceModel));
  }
}
