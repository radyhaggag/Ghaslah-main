part of 'gifts_bloc.dart';

abstract class GiftsState extends Equatable {
  const GiftsState();

  @override
  List<Object> get props => [];
}

class GiftsInitial extends GiftsState {}

class SendGiftLoading extends GiftsState {}

class SendGiftLoadingSuccess extends GiftsState {
  final bool result;

  const SendGiftLoadingSuccess(this.result);
}

class SendGiftLoadingFailed extends GiftsState {
  final String message;

  const SendGiftLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

class GetAllGiftsLoading extends GiftsState {}

class GetAllGiftsLoadingSuccess extends GiftsState {
  final List<GiftModel> gifts;

  const GetAllGiftsLoadingSuccess(this.gifts);
}

class GetAllGiftsLoadingFailed extends GiftsState {
  final String message;

  const GetAllGiftsLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

class DeleteGiftLoading extends GiftsState {}

class DeleteGiftLoadingSuccess extends GiftsState {
  final bool result;

  const DeleteGiftLoadingSuccess(this.result);
}

class DeleteGiftLoadingFailed extends GiftsState {
  final String message;

  const DeleteGiftLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
