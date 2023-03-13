import 'package:equatable/equatable.dart';

class PlaceDetailsModel extends Equatable {
  final String formattedAddress;
  final LocationModel location;
  const PlaceDetailsModel({
    required this.formattedAddress,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'formatted_address': formattedAddress,
      'geometry': {
        'location': location.toMap(),
      },
    };
  }

  factory PlaceDetailsModel.fromMap(Map<String, dynamic> map) {
    return PlaceDetailsModel(
      formattedAddress: map['formatted_address'] as String,
      location: LocationModel.fromMap(
        map['geometry']['location'] as Map<String, dynamic>,
      ),
    );
  }

  @override
  List<Object> get props => [formattedAddress, location];
}

class LocationModel extends Equatable {
  final double lat;
  final double lng;

  const LocationModel({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  LocationModel copyWith({
    double? lat,
    double? lng,
  }) {
    return LocationModel(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  List<Object> get props => [lat, lng];
}
