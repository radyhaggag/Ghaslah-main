import 'package:equatable/equatable.dart';

import '../../../reservation/data/models/car_model.dart';
import 'reservation_service_model.dart';

class ReservationModel extends Equatable {
  final int id;
  final String location;
  final String? amount;
  final int? points;
  final String date;
  final String paymentMethod;
  final String? pickerId;
  final int carId;
  final String customerId;
  final String status;
  final CarModel car;
  final List<ReservationServiceModel> services;

  const ReservationModel({
    required this.id,
    required this.location,
    required this.amount,
    required this.date,
    required this.pickerId,
    required this.carId,
    required this.customerId,
    required this.status,
    required this.car,
    required this.services,
    required this.paymentMethod,
    required this.points,
  });

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      id: map['id'] as int,
      points: map['points'] as int?,
      paymentMethod: map['paymentMethod'] as String,
      location: map['location'] as String,
      amount: map['amount'] as String?,
      date: map['date'] as String,
      pickerId: map['pickerId'] as String?,
      carId: map['carId'] as int,
      customerId: map['customerId'] as String,
      status: map['status']['name'] as String,
      car: CarModel.fromMap(map['car'] as Map<String, dynamic>),
      services: List<ReservationServiceModel>.from(
        map['services'].map(
          (e) => ReservationServiceModel.fromMap(e),
        ),
      ),
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      location,
      amount,
      date,
      pickerId,
      carId,
      customerId,
      status,
      car,
      services,
      points,
      paymentMethod,
    ];
  }
}
