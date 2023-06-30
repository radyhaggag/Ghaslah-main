import 'package:equatable/equatable.dart';

import 'birthday_model.dart';

class RegisterModel extends Equatable {
  final String email;
  final String name;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final int cityId;
  final String? gender;
  final BirthDayModel birthDay;

  const RegisterModel({
    required this.email,
    required this.name,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.cityId,
    this.gender,
    required this.birthDay,
  });

  RegisterModel copyWith({
    String? email,
    String? name,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
    int? cityId,
    String? gender,
    BirthDayModel? birthDay,
  }) {
    return RegisterModel(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cityId: cityId ?? this.cityId,
      gender: gender ?? this.gender,
      birthDay: birthDay ?? this.birthDay,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber,
      'cityId': cityId,
      'gender': gender ?? 'لم يتم تحديده',
      'birthDay': birthDay.toMap(),
    };
  }

  @override
  List<Object?> get props {
    return [
      email,
      name,
      password,
      confirmPassword,
      phoneNumber,
      cityId,
      gender,
      birthDay,
    ];
  }
}
