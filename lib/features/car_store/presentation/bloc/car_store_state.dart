part of 'car_store_bloc.dart';

abstract class CarStoreState extends Equatable {
  const CarStoreState();  

  @override
  List<Object> get props => [];
}
class CarStoreInitial extends CarStoreState {}
