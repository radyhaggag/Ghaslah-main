class ErrorModel {
  final String error;
  final int httpStatusCode;
  final String description;
  final bool status;
  ErrorModel({
    required this.error,
    required this.httpStatusCode,
    required this.description,
    required this.status,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      error: map['error'] as String,
      httpStatusCode: map['httpStatusCode'] as int,
      description: map['description'] is List
          ? "${map['description'][0]['param']} ${map['description'][0]['msg']}"
          : map['description'] ?? "خطأ غير معروف يمكنك المحاولة لاحقا",
      status: map['success'] as bool,
    );
  }
}
