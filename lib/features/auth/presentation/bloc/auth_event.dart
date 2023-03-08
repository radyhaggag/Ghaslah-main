// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class UpdatePhoneNumber extends AuthEvent {
  final String phoneNumber;

  const UpdatePhoneNumber(this.phoneNumber);
}

class UpdateOtpCode extends AuthEvent {
  final String otpCode;

  const UpdateOtpCode(this.otpCode);
}

class SendOtpCode extends AuthEvent {}

class VerifyOtpCode extends AuthEvent {}

class ChangeCrossFadeState extends AuthEvent {
  final int index;

  const ChangeCrossFadeState(this.index);

  @override
  List<Object> get props => [index];
}

class UpdateRegisterModel extends AuthEvent {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? password;
  final String? confirmPassword;
  final String? gender;
  final BirthDayModel? birthDay;
  final int? cityId;

  const UpdateRegisterModel({
    this.confirmPassword,
    this.gender,
    this.birthDay,
    this.cityId,
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
  });

  @override
  List<Object?> get props => [gender];
}

class RegisterUser extends AuthEvent {}
