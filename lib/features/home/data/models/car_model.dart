import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  final String color;
  final String model;
  final String id;
  final String? cardSignNumbers;
  const CarModel({
    required this.color,
    required this.model,
    required this.id,
    this.cardSignNumbers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'color': color,
      'model': model,
      'id': id,
      'cardSignNumbers': cardSignNumbers,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      color: map['color'] as String,
      model: map['model'] as String,
      id: map['id'] as String,
      cardSignNumbers: map['cardSignNumbers'] as String?,
    );
  }

  @override
  List<Object?> get props => [color, model, id, cardSignNumbers];
}
