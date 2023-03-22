import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghaslah/features/profile/data/services/profile_services.dart';

import '../../data/models/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileServices profileServices;
  ProfileBloc(this.profileServices) : super(ProfileInitial()) {
    on<GetProfile>(_getProfile);
  }

  Future<void> _getProfile(GetProfile event, Emitter<ProfileState> emit) async {
    emit(GetProfileLoading());

    final res = await profileServices.getProfile();

    res.fold(
      (failure) => emit(GetProfileLoadingFailed(failure.message)),
      (result) => emit(GetProfileLoadingSuccess(result)),
    );
  }
}
