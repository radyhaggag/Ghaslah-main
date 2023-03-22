import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final int? serviceId;
  final String? location;
  final int? workHourId;
  final int? carId;
  final String? paymentMethod;
  final List<int> additionalServices;

  const BookModel({
    this.serviceId,
    this.location,
    this.workHourId,
    this.carId,
    this.paymentMethod,
    required this.additionalServices,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceId': serviceId,
      'location': location,
      'workHourId': workHourId,
      'carId': carId,
      'paymentMethod': paymentMethod,
      'additionalServicesIds': additionalServices,
    };
  }

  @override
  List<Object?> get props {
    return [
      serviceId,
      location,
      workHourId,
      carId,
      additionalServices,
      paymentMethod,
    ];
  }

  BookModel copyWith({
    int? serviceId,
    String? location,
    int? workHourId,
    int? carId,
    String? paymentMethod,
    List<int>? additionalServices,
  }) {
    return BookModel(
      serviceId: serviceId ?? this.serviceId,
      location: location ?? this.location,
      workHourId: workHourId ?? this.workHourId,
      carId: carId ?? this.carId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      additionalServices: additionalServices ?? this.additionalServices,
    );
  }
}
