import 'package:equatable/equatable.dart';

import '../../../../core/utils/constants_manager.dart';

class ReservationServiceModel extends Equatable {
  final int id;
  final String name;
  final String image;
  final bool isAdditional;
  final ReservationsServices reservationsServices;
  const ReservationServiceModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isAdditional,
    required this.reservationsServices,
  });

  factory ReservationServiceModel.fromMap(Map<String, dynamic> map) {
    return ReservationServiceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: "${AppConstants.baseImageUrl}${map['image']}",
      isAdditional: map['isAdditional'] as bool,
      reservationsServices: ReservationsServices.fromMap(
          map['reservationsServices'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      image,
      isAdditional,
      reservationsServices,
    ];
  }
}

class ReservationsServices extends Equatable {
  final int id;
  final int reservationId;
  final int serviceId;
  const ReservationsServices({
    required this.id,
    required this.reservationId,
    required this.serviceId,
  });

  factory ReservationsServices.fromMap(Map<String, dynamic> map) {
    return ReservationsServices(
      id: map['id'] as int,
      reservationId: map['reservationId'] as int,
      serviceId: map['serviceId'] as int,
    );
  }

  @override
  List<Object> get props => [id, reservationId, serviceId];
}
