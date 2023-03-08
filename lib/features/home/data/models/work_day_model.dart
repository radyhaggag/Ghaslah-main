import 'package:equatable/equatable.dart';

class WorkDayModel extends Equatable {
  final String date;

  const WorkDayModel(this.date);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
    };
  }

  factory WorkDayModel.fromMap(Map<String, dynamic> map) {
    return WorkDayModel(
      map['date'] as String,
    );
  }

  @override
  List<Object> get props => [date];
}
