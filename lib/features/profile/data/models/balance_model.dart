import 'package:equatable/equatable.dart';

class BalanceModel extends Equatable {
  final int id;
  final String balance;
  final String lastTransaction;
  const BalanceModel({
    required this.id,
    required this.balance,
    required this.lastTransaction,
  });

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      id: map['id'] as int,
      balance: map['balance'] as String,
      lastTransaction: map['lastTransaction'] as String,
    );
  }

  @override
  List<Object> get props => [id, balance, lastTransaction];
}

class PointModel extends Equatable {
  final int id;
  final int points;
  const PointModel({
    required this.id,
    required this.points,
  });

  factory PointModel.fromMap(Map<String, dynamic> map) {
    return PointModel(
      id: map['id'] as int,
      points: map['points'] as int,
    );
  }

  @override
  List<Object> get props => [id, points];
}
