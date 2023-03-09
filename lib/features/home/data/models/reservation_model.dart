import 'package:equatable/equatable.dart';

class ReservationModel extends Equatable {
  final int id;
  final String location;
  final int workHourId;
  final int carId;

  const ReservationModel({
    required this.id,
    required this.location,
    required this.workHourId,
    required this.carId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'location': location,
      'workHourId': workHourId,
      'carId': carId,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      id: map['id'] as int,
      location: map['location'] as String,
      workHourId: map['workHourId'] as int,
      carId: map['carId'] as int,
    );
  }

  @override
  List<Object> get props => [id, location, workHourId, carId];
}
