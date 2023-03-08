// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class RegisterFieldsUpdate extends AuthState {
  final String gender;

  const RegisterFieldsUpdate({
    required this.gender,
  });

  @override
  List<Object?> get props => [gender];
}
