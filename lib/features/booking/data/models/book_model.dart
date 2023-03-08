// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ghaslah/features/home/data/models/car_model.dart';

class BookModel {
  final String? bookDate;
  final String? location;
  final CarModel? car;
  final String? note;
  final String? hour;

  BookModel({
    this.bookDate,
    this.location,
    this.car,
    this.note,
    this.hour,
  });

  BookModel copyWith({
    String? bookDay,
    String? location,
    CarModel? car,
    String? note,
    String? hour,
  }) {
    return BookModel(
      bookDate: bookDay ?? this.bookDate,
      location: location ?? this.location,
      car: car ?? this.car,
      note: note ?? this.note,
      hour: hour ?? this.hour,
    );
  }
}
