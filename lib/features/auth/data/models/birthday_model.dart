import 'package:equatable/equatable.dart';

class BirthDayModel extends Equatable {
  final int? year;
  final int? month;
  final int? day;

  const BirthDayModel({this.year, this.month, this.day});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'year': year,
      'month': month,
      'day': day,
    };
  }

  factory BirthDayModel.fromMap(Map<String, dynamic> map) {
    return BirthDayModel(
      year: map['year'] != null ? map['year'] as int : null,
      month: map['month'] != null ? map['month'] as int : null,
      day: map['day'] != null ? map['day'] as int : null,
    );
  }

  BirthDayModel copyWith({
    int? year,
    int? month,
    int? day,
  }) {
    return BirthDayModel(
      year: year ?? this.year,
      month: month ?? this.month,
      day: day ?? this.day,
    );
  }

  @override
  List<Object?> get props => [year, month, day];
}
