import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String cityName;
  final String password;

  const RegisterModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.cityName,
    required this.password,
  });

  @override
  List<Object> get props {
    return [
      name,
      email,
      phoneNumber,
      cityName,
      password,
    ];
  }

  RegisterModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? cityName,
    String? password,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cityName: cityName ?? this.cityName,
      password: password ?? this.password,
    );
  }
}
