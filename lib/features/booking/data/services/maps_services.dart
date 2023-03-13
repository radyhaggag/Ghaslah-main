import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../models/place_details_model.dart';
import '../models/place_suggestion_model.dart';

class MapsServices {
  final Dio dio;

  MapsServices(this.dio);

  Future<Either<Failure, List<PlaceSuggestionModel>>> getSuggestions(
    String input,
    String sessiontoken,
  ) async {
    try {
      const baseUrl =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';

      final res = await dio.get(
        baseUrl,
        queryParameters: {
          'input': input,
          'key': 'AIzaSyATFetwiDwtschvkgtuQvtQK4cEf2SO__8',
          'type': 'address',
          'sessiontoken': sessiontoken,
          'language': 'ar',
        },
      );
      final data = res.data;

      final suggestions = List<PlaceSuggestionModel>.from(
        data['predictions'].map((e) => PlaceSuggestionModel.fromMap(e)),
      );

      return right(suggestions);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, PlaceDetailsModel>> getPlaceDetailsByPlaceId(
    String placeId,
    String sessiontoken,
  ) async {
    try {
      const baseUrl = 'https://maps.googleapis.com/maps/api/place/details/json';

      final res = await dio.get(
        baseUrl,
        queryParameters: {
          'place_id': placeId,
          'key': 'AIzaSyATFetwiDwtschvkgtuQvtQK4cEf2SO__8',
          'fields': 'formatted_address,name,geometry',
          'sessiontoken': sessiontoken,
          'language': 'ar',
          // 'language' :
        },
      );
      final data = res.data;

      final placeDetails = PlaceDetailsModel.fromMap(data['result']);
      return right(placeDetails);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }

  Future<Either<Failure, PlaceDetailsModel>> getPlaceDetailsByLatLng({
    required double lat,
    required double lng,
    required String sessiontoken,
  }) async {
    try {
      const baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';

      final res = await dio.get(
        baseUrl,
        queryParameters: {
          'latlng': "$lat,$lng",
          'key': 'AIzaSyATFetwiDwtschvkgtuQvtQK4cEf2SO__8',
          'sessiontoken': sessiontoken,
          'language': 'ar',
          // 'language' :
        },
      );
      final data = res.data;

      final placeDetails = PlaceDetailsModel.fromMap(data['results'][0]);
      return right(placeDetails);
    } catch (e) {
      return left(ErrorHandler.handle(e).failure);
    }
  }
}
