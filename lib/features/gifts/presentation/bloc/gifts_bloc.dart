import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ghaslah/features/gifts/data/models/gift_model.dart';
import 'package:ghaslah/features/gifts/data/services/gifts_services.dart';

import '../../data/models/send_gift_model.dart';

part 'gifts_event.dart';
part 'gifts_state.dart';

class GiftsBloc extends Bloc<GiftsEvent, GiftsState> {
  final GiftsServices giftsServices;
  GiftsBloc(this.giftsServices) : super(GiftsInitial()) {
    on<SendGift>(_sendGift);
    on<GetAllGifts>(_getAllGifts);
    on<DeleteGift>(_deleteGift);
  }

  Future<void> _sendGift(
    SendGift event,
    Emitter<GiftsState> emit,
  ) async {
    emit(SendGiftLoading());
    final res = await giftsServices.sendGift(event.sendGiftModel);

    res.fold(
      (failure) => emit(SendGiftLoadingFailed(failure.message)),
      (result) => emit(SendGiftLoadingSuccess(result)),
    );
  }

  Future<void> _getAllGifts(
    GetAllGifts event,
    Emitter<GiftsState> emit,
  ) async {
    emit(GetAllGiftsLoading());
    final res = await giftsServices.getAllGifts();

    res.fold(
      (failure) => emit(GetAllGiftsLoadingFailed(failure.message)),
      (result) => emit(GetAllGiftsLoadingSuccess(result)),
    );
  }

  Future<void> _deleteGift(
    DeleteGift event,
    Emitter<GiftsState> emit,
  ) async {
    emit(DeleteGiftLoading());
    final res = await giftsServices.deleteGift(event.giftId);

    res.fold(
      (failure) => emit(DeleteGiftLoadingFailed(failure.message)),
      (result) => emit(DeleteGiftLoadingSuccess(result)),
    );
  }
}
