import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'car_store_event.dart';
part 'car_store_state.dart';

class CarStoreBloc extends Bloc<CarStoreEvent, CarStoreState> {
  CarStoreBloc() : super(CarStoreInitial()) {
    on<CarStoreEvent>((event, emit) {});
  }
}
