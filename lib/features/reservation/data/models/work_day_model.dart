import 'package:equatable/equatable.dart';
import 'work_hours_model.dart';

class WorkDayModel extends Equatable {
  final int id;
  final String date;
  final String name;
  final bool isHoliday;
  final List<WorkHoursModel>? workHours;

  const WorkDayModel({
    required this.id,
    required this.date,
    required this.name,
    required this.isHoliday,
    this.workHours,
  });

  factory WorkDayModel.fromMap(Map<String, dynamic> map) {
    return WorkDayModel(
      id: map['id'] as int,
      date: map['date'] as String,
      name: map['name'] as String,
      isHoliday: map['isHoliday'] as bool,
      workHours: map['workHours'] != null
          ? List<WorkHoursModel>.from(
              map['workHours'].map((e) => WorkHoursModel.fromMap(e)),
            )
          : null,
    );
  }

  @override
  List<Object?> get props => [id, date, name, isHoliday, workHours];
}
