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
