import 'package:equatable/equatable.dart';

class SendGiftModel extends Equatable {
  final String receiver;
  final String message;
  final int amount;

  const SendGiftModel({
    required this.receiver,
    required this.message,
    required this.amount,
  });

  @override
  List<Object> get props => [receiver, message, amount];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recieverPhoneNumber': receiver,
      'message': message,
      'amount': amount,
    };
  }

  factory SendGiftModel.fromMap(Map<String, dynamic> map) {
    return SendGiftModel(
      receiver: map['recieverPhoneNumber '] as String,
      message: map['message'] as String,
      amount: map['amount'] as int,
    );
  }
}
