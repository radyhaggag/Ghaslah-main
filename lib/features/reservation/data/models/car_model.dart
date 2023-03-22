import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final int id;
  final String color;
  final String model;
  final CarPlate? plate;
  final String? customerId;

  const CarModel({
    required this.id,
    required this.model,
    required this.color,
    required this.plate,
    this.customerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'model': model,
      'plate': plate!.toMap(),
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] as int,
      color: map['color'] as String,
      model: map['model'] as String,
      customerId: map['customerId'] as String?,
      plate: map['plate'] != null
          ? CarPlate.fromMap(map['plate'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [id, model, color, customerId, plate];
}

class CarPlate extends Equatable {
  final int? number;
  final String? letter;

  const CarPlate({
    this.number,
    this.letter,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'letter': letter,
    };
  }

  factory CarPlate.fromMap(Map<String, dynamic> map) {
    return CarPlate(
      number: map['number'] as int?,
      letter: map['letter'] as String?,
    );
  }

  @override
  List<Object?> get props => [number, letter];
}
