import 'package:equatable/equatable.dart';

class WorkHoursModel extends Equatable {
  final int id;
  final String hour;
  final String date;
  final int? availablePlaces;
  final int workDayId;
  const WorkHoursModel({
    required this.id,
    required this.hour,
    required this.date,
    this.availablePlaces,
    required this.workDayId,
  });

  factory WorkHoursModel.fromMap(Map<String, dynamic> map) {
    return WorkHoursModel(
      id: map['id'] as int,
      hour: map['hour'] as String,
      date: map['date'] as String,
      availablePlaces: map['availablePlaces'] as int?,
      workDayId: map['workDayId'] as int,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      hour,
      date,
      availablePlaces,
      workDayId,
    ];
  }
}
