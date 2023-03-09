import 'package:equatable/equatable.dart';

import '../../../../core/utils/constants_manager.dart';

class ServiceModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final String price;
  final bool isAdditional;
  final double? servicesDiscount;
  final int? numberOfReservation;
  // final String? date;
  const ServiceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isAdditional,
    this.servicesDiscount,
    this.numberOfReservation,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: "${AppConstants.baseImageUrl}${map['image']}",
      price: map['price'] as String,
      isAdditional: map['isAdditional'] as bool,
      servicesDiscount: map['servicesDiscount'] != null
          ? map['servicesDiscount'] as double
          : null,
      numberOfReservation: map['numberOfReservation'] != null
          ? map['numberOfReservation'] as int
          : null,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      image,
      price,
      isAdditional,
      servicesDiscount,
      numberOfReservation,
    ];
  }
}
