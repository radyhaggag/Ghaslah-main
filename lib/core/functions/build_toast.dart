import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/color_manager.dart';

enum ToastType { success, error }

extension ToastTypeExtension on ToastType {
  Color getColor() {
    switch (this) {
      case ToastType.success:
        return AppColors.purpleCircleColor;
      case ToastType.error:
        return AppColors.red;
    }
  }
}

Future<bool?> buildToast({
  required ToastType toastType,
  required String msg,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    backgroundColor: toastType.getColor(),
    textColor: AppColors.whiteColor,
    toastLength:
        toastType == ToastType.error ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
  );
}
