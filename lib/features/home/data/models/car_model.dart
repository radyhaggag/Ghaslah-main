import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final String id;
  final String color;
  final String model;
  final CarPlate plate;

  const CarModel({
    required this.id,
    required this.model,
    required this.color,
    required this.plate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'model': model,
      'plate': plate.toMap(),
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      id: map['id'] as String,
      color: map['color'] as String,
      model: map['model'] as String,
      plate: CarPlate.fromMap(map['plate'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object> get props => [id, model, plate];
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
