import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final int? serviceId;
  final String? location;
  final int? workHourId;
  final int? carId;
  final List<int> additionalServices;

  const BookModel({
    this.serviceId,
    this.location,
    this.workHourId,
    this.carId,
    required this.additionalServices,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceId': serviceId,
      'location': location,
      'workHourId': workHourId,
      'carId': carId,
      'additionalServices': additionalServices,
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
    ];
  }

  BookModel copyWith({
    int? serviceId,
    String? location,
    int? workHourId,
    int? carId,
    List<int>? additionalServices,
  }) {
    return BookModel(
      serviceId: serviceId ?? this.serviceId,
      location: location ?? this.location,
      workHourId: workHourId ?? this.workHourId,
      carId: carId ?? this.carId,
      additionalServices: additionalServices ?? this.additionalServices,
    );
  }
}
