import 'package:equatable/equatable.dart';

class ServicesDiscountModel extends Equatable {
  final int id;
  final int percentage;
  final String createdAt;
  final String expiredAt;
  const ServicesDiscountModel({
    required this.id,
    required this.percentage,
    required this.createdAt,
    required this.expiredAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'percentage': percentage,
      'createdAt': createdAt,
      'expiredAt': expiredAt,
    };
  }

  factory ServicesDiscountModel.fromMap(Map<String, dynamic> map) {
    return ServicesDiscountModel(
      id: map['id'] as int,
      percentage: map['percentage'] as int,
      createdAt: map['createdAt'] as String,
      expiredAt: map['expirationAt'] as String,
    );
  }

  @override
  List<Object> get props => [id, percentage, createdAt, expiredAt];
}
