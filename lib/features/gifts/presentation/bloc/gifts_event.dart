part of 'gifts_bloc.dart';

abstract class GiftsEvent extends Equatable {
  const GiftsEvent();

  @override
  List<Object> get props => [];
}

class SendGift extends GiftsEvent {
  final SendGiftModel sendGiftModel;

  const SendGift(this.sendGiftModel);

  @override
  List<Object> get props => [sendGiftModel];
}

class GetAllGifts extends GiftsEvent {}

class DeleteGift extends GiftsEvent {
  final int giftId;

  const DeleteGift(this.giftId);

  @override
  List<Object> get props => [giftId];
}
