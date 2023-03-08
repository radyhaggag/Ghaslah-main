part of 'gifts_bloc.dart';

abstract class GiftsState extends Equatable {
  const GiftsState();  

  @override
  List<Object> get props => [];
}
class GiftsInitial extends GiftsState {}
