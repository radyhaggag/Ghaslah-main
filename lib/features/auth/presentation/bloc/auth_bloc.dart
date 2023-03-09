import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/city_model.dart';
import '../../data/services/auth_services.dart';

import '../../data/models/birthday_model.dart';
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
    on<GetCities>(_getCities);
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
    final res = await authServices.sendOtpCode(_phoneNumber);
    res.fold(
      (failure) => emit(OtpCodeSendFailed(failure.message)),
      (otpCode) => emit(OtpCodeSendSuccess()),
    );
  }

  Future<void> _verifyOtpCode(
    VerifyOtpCode event,
    Emitter<AuthState> emit,
  ) async {
    emit(OtpCodeVerifyLoading());
    final res = await authServices.verifyOtpCode(_otpCode, _phoneNumber);
    res.fold(
      (failure) => emit(OtpCodeVerifyFailed(failure.message)),
      (result) => emit(OtpCodeVerifySuccess(result)),
    );
  }

  _changeCrossFadeState(
    ChangeCrossFadeState event,
    Emitter<AuthState> emit,
  ) {
    emit(LoginCrossFadeStateChanged(event.index));
  }

  RegisterModel registerModel = const RegisterModel(
    name: '',
    email: '',
    phoneNumber: '',
    password: '',
    birthDay: BirthDayModel(),
    cityId: 1,
    confirmPassword: '',
  );

  _updateRegisterModel(UpdateRegisterModel event, Emitter<AuthState> emit) {
    registerModel = registerModel.copyWith(
      cityId: event.cityId,
      email: event.email,
      name: event.name,
      password: event.password,
      phoneNumber: event.phoneNumber,
      gender: event.gender,
      birthDay: event.birthDay,
      confirmPassword: event.confirmPassword,
    );
    if (event.gender != null) {
      emit(RegisterGenderFieldsUpdate(gender: registerModel.gender!));
    }
    if (event.cityId != null) {
      emit(RegisterCityFieldsUpdate(cityId: event.cityId!));
    }
  }

  FutureOr<void> _registerUser(
    RegisterUser event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegisterUserLoading());
    final res = await authServices.register(registerModel);
    res.fold(
      (failure) => emit(RegisterUserFailed(failure.message)),
      (result) => emit(RegisterUserSuccess(result)),
    );
  }

  Future<void> _getCities(GetCities event, Emitter<AuthState> emit) async {
    emit(GetCitiesLoading());
    final res = await authServices.getCities();
    res.fold(
      (failure) => emit(GetCitiesFailed(failure.message)),
      (result) => emit(GetCitiesSuccess(result)),
    );
  }
}
