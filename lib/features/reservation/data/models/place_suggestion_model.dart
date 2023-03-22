import 'package:equatable/equatable.dart';

class PlaceSuggestionModel extends Equatable {
  final String placeId;
  final String description;

  const PlaceSuggestionModel({
    required this.placeId,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'placeId': placeId,
      'description': description,
    };
  }

  factory PlaceSuggestionModel.fromMap(Map<String, dynamic> map) {
    return PlaceSuggestionModel(
      placeId: map['place_id'] as String,
      description: map['description'] as String,
    );
  }

  @override
  List<Object> get props => [placeId, description];
}
