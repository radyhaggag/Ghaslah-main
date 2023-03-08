part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class OtpCodeSendLoading extends AuthState {}

class OtpCodeSendSuccess extends AuthState {}

class OtpCodeSendFailed extends AuthState {
  final String message;

  const OtpCodeSendFailed(this.message);
}

class OtpCodeVerifyLoading extends AuthState {}

class OtpCodeVerifySuccess extends AuthState {}

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

class RegisterUserSuccess extends AuthState {}

class RegisterUserFailed extends AuthState {
  final String message;

  const RegisterUserFailed(this.message);
}
