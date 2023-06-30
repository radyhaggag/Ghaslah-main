import 'package:equatable/equatable.dart';

class GiftModel extends Equatable {
  final String senderPhoneNumber;
  final String message;
  final dynamic amount;
  final int id;

  const GiftModel({
    required this.senderPhoneNumber,
    required this.message,
    required this.amount,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderPhoneNumber': senderPhoneNumber,
      'message': message,
      'amount': amount,
    };
  }

  factory GiftModel.fromMap(Map<String, dynamic> map) {
    return GiftModel(
      senderPhoneNumber: map['senderPhoneNumber'] as String,
      message: map['message'] as String,
      amount: map['amount'] as dynamic,
      id: map['id'] as int,
    );
  }

  @override
  List<Object> get props => [senderPhoneNumber, message, amount];
}
