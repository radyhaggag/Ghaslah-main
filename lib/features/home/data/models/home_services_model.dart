import 'package:equatable/equatable.dart';
import 'service_model.dart';

class HomeServicesModel extends Equatable {
  final List<ServiceModel> mainServices;
  final List<ServiceModel> additionalServices;

  const HomeServicesModel({
    required this.mainServices,
    required this.additionalServices,
  });

  factory HomeServicesModel.fromMap(Map<String, dynamic> map) {
    return HomeServicesModel(
      mainServices: List<ServiceModel>.from(
        map['services'].map(
          (x) => ServiceModel.fromMap(x),
        ),
      ),
      additionalServices: List<ServiceModel>.from(
        map['additionalServices'].map(
          (x) => ServiceModel.fromMap(x),
        ),
      ),
    );
  }

  @override
  List<Object> get props => [mainServices, additionalServices];
}
