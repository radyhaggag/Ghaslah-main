import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gifts_event.dart';
part 'gifts_state.dart';

class GiftsBloc extends Bloc<GiftsEvent, GiftsState> {
  GiftsBloc() : super(GiftsInitial()) {
    on<GiftsEvent>((event, emit) {});
  }
}
