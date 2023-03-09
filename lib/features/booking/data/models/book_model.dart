// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ghaslah/features/home/data/models/car_model.dart';
import 'package:ghaslah/features/home/data/models/service_model.dart';

class BookModel {
  final String? day;
  final String? location;
  final CarModel? car;
  final String? note;
  final String? hour;
  final ServiceModel? mainService;
  final List<ServiceModel>? additionalServices;

  BookModel({
    this.day,
    this.location,
    this.car,
    this.note,
    this.hour,
    this.additionalServices,
    this.mainService,
  });

  BookModel copyWith({
    String? day,
    String? location,
    CarModel? car,
    String? note,
    String? hour,
    ServiceModel? mainService,
    List<ServiceModel>? additionalServices,
  }) {
    return BookModel(
      day: day ?? this.day,
      location: location ?? this.location,
      car: car ?? this.car,
      note: note ?? this.note,
      hour: hour ?? this.hour,
      mainService: mainService ?? this.mainService,
      additionalServices: additionalServices ?? this.additionalServices,
    );
  }
}
