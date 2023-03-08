import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/features/auth/data/services/auth_services.dart';

import '../../data/models/register_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices authServices;
  AuthBloc(this.authServices) : super(AuthInitial()) {
    on<UpdateOtpCode>(_updateOtpCode);
    on<UpdatePhoneNumber>(_updatePhoneNumber);
    on<SendOtpCode>(_sendOtpCode);
    on<VerifyOtpCode>(_verifyOtpCode);
    on<ChangeCrossFadeState>(_changeCrossFadeState);
    on<UpdateRegisterModel>(_updateRegisterModel);
    on<RegisterUser>(_registerUser);
  }

  String _phoneNumber = '';
  String _otpCode = '';

  void _updateOtpCode(UpdateOtpCode event, Emitter<AuthState> emit) {
    _otpCode = event.otpCode;
  }

  void _updatePhoneNumber(UpdatePhoneNumber event, Emitter<AuthState> emit) {
    _phoneNumber = event.phoneNumber;
  }

  Future<void> _sendOtpCode(SendOtpCode event, Emitter<AuthState> emit) async {
    emit(OtpCodeSendLoading());
  }

  Future<void> _verifyOtpCode(
      VerifyOtpCode event, Emitter<AuthState> emit) async {
    emit(OtpCodeVerifyLoading());
  }

  _changeCrossFadeState(
    ChangeCrossFadeState event,
    Emitter<AuthState> emit,
  ) {
    emit(LoginCrossFadeStateChanged(event.index));
  }

  RegisterModel _registerModel = const RegisterModel(
    name: '',
    email: '',
    phoneNumber: '',
    cityName: '',
    password: '',
  );

  _updateRegisterModel(UpdateRegisterModel event, Emitter<AuthState> emit) {
    _registerModel = _registerModel.copyWith(
      cityName: event.cityName,
      email: event.email,
      name: event.name,
      password: event.password,
      phoneNumber: event.phoneNumber,
    );
  }

  FutureOr<void> _registerUser(
    RegisterUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegisterUserLoading());
  }
}
