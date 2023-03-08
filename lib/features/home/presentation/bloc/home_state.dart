part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomePageModuleChanged extends HomeState {
  final int index;

  const HomePageModuleChanged(this.index);

  @override
  List<Object> get props => [index];
}
