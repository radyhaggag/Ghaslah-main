import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  final String name;
  final int id;

  const CityModel({
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  @override
  List<Object> get props => [name, id];
}
