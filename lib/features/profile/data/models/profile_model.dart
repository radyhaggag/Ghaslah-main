import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'balance_model.dart';

class ProfileModel extends Equatable {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final String birthDay;
  final String gender;
  final int cityId;
  final BalanceModel balance;
  final PointModel point;

  const ProfileModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.birthDay,
    required this.gender,
    required this.cityId,
    required this.balance,
    required this.point,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      birthDay: map['birthDay'] as String,
      gender: map['gender'] as String,
      cityId: map['cityId'] as int,
      balance: BalanceModel.fromMap(map['balance'] as Map<String, dynamic>),
      point: PointModel.fromMap(map['point'] as Map<String, dynamic>),
    );
  }

  factory ProfileModel.fromJson(String source) =>
      ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props {
    return [
      id,
      name,
      phoneNumber,
      email,
      birthDay,
      gender,
      cityId,
      balance,
      point,
    ];
  }
}
