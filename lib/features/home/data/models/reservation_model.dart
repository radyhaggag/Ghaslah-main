import 'package:equatable/equatable.dart';

import '../../../booking/data/models/car_model.dart';
import 'service_model.dart';

class ReservationModel extends Equatable {
  final int id;
  final String location;
  final String amount;
  final String date;
  final dynamic pickerId;
  final int carId;
  final String customerId;
  final int serviceId;
  final String status;
  final CarModel car;
  final ServiceModel service;

  const ReservationModel({
    required this.id,
    required this.location,
    required this.amount,
    required this.date,
    required this.pickerId,
    required this.carId,
    required this.customerId,
    required this.serviceId,
    required this.status,
    required this.car,
    required this.service,
  });

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      id: map['id'] as int,
      location: map['location'] as String,
      amount: map['amount'] as String,
      date: map['date'] as String,
      pickerId: map['pickerId'] as dynamic,
      carId: map['carId'] as int,
      customerId: map['customerId'] as String,
      serviceId: map['serviceId'] as int,
      status: map['status']['name'] as String,
      car: CarModel.fromMap(map['car'] as Map<String, dynamic>),
      service: ServiceModel.fromMap(map['service'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      location,
      amount,
      date,
      pickerId,
      carId,
      customerId,
      serviceId,
      status,
      car,
      service,
    ];
  }
}
