import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final String name;
  final String description;
  final double price;
  final String serviceType;
  final String date;
  final double? discount;
  final String imageUrl;

  const ServiceModel({
    required this.name,
    required this.description,
    required this.price,
    required this.serviceType,
    required this.date,
    this.discount,
    required this.imageUrl,
  });

  @override
  List<Object?> get props {
    return [
      name,
      description,
      price,
      serviceType,
      date,
      discount,
      imageUrl,
    ];
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      serviceType: map['serviceType'] as String,
      date: map['date'] as String,
      discount: map['discount'] != null ? map['discount'] as double : null,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
