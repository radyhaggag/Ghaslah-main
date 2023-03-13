import 'package:flutter/material.dart';
import '../utils/extension.dart';

import '../utils/color_manager.dart';
import '../widgets/center_progress_indicator.dart';

buildCenterDialogIndicator(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: AppColors.greyColor,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SizedBox(
          width: context.width / 3,
          height: context.width / 3,
          child: const CenterProgressIndicator(),
        ),
      ),
    ),
  );
}
