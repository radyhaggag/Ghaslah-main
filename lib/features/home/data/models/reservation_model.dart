import 'package:equatable/equatable.dart';

class ReservationModel extends Equatable {
  final String date;
  final bool status;
  const ReservationModel({
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'status': status,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      date: map['date'] as String,
      status: map['status'] as bool,
    );
  }

  @override
  List<Object> get props => [date, status];
}
