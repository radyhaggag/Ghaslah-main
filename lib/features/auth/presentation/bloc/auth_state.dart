part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class OtpCodeSendLoading extends AuthState {}

class OtpCodeSendSuccess extends AuthState {}

class OtpCodeSendFailed extends AuthState {
  final String message;

  const OtpCodeSendFailed(this.message);
}

class OtpCodeVerifyLoading extends AuthState {}

class OtpCodeVerifySuccess extends AuthState {
  final bool result;

  const OtpCodeVerifySuccess(this.result);
}

class OtpCodeVerifyFailed extends AuthState {
  final String message;

  const OtpCodeVerifyFailed(this.message);
}

class LoginCrossFadeStateChanged extends AuthState {
  final int index;

  const LoginCrossFadeStateChanged(this.index);

  @override
  List<Object> get props => [index];
}

class RegisterUserLoading extends AuthState {}

class RegisterUserSuccess extends AuthState {
  final bool result;

  const RegisterUserSuccess(this.result);
}

class RegisterUserFailed extends AuthState {
  final String message;

  const RegisterUserFailed(this.message);
}

class RegisterGenderFieldsUpdate extends AuthState {
  final String gender;

  const RegisterGenderFieldsUpdate({
    required this.gender,
  });

  @override
  List<Object?> get props => [gender];
}

class RegisterCityFieldsUpdate extends AuthState {
  final int cityId;

  const RegisterCityFieldsUpdate({
    required this.cityId,
  });

  @override
  List<Object?> get props => [cityId];
}

class GetCitiesLoading extends AuthState {}

class GetCitiesSuccess extends AuthState {
  final List<CityModel> cities;

  const GetCitiesSuccess(this.cities);
}

class GetCitiesFailed extends AuthState {
  final String message;

  const GetCitiesFailed(this.message);
}
