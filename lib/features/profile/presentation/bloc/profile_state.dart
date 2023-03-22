// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class GetProfileLoading extends ProfileState {}

class GetProfileLoadingSuccess extends ProfileState {
  final ProfileModel profile;

  const GetProfileLoadingSuccess(this.profile);
}

class GetProfileLoadingFailed extends ProfileState {
  final String message;

  const GetProfileLoadingFailed(this.message);
}
