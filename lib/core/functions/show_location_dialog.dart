import 'package:flutter/material.dart';
import '../utils/extension.dart';
import '../helpers/location_helper.dart';
import '../widgets/custom_button.dart';
import 'build_toast.dart';

Future<void> showLocationDialog(context) async {
  await showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "يجب المساح بالوصول الى موقعك للاستمرار",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            CustomButton(
              text: "السماح",
              width: context.width / 2,
              onPressed: () async {
                final res = await LocationHelper.requestPermission();
                if (res && context.mounted) {
                  Navigator.pop(context);
                } else {
                  buildToast(
                    msg: "يجب المساح بالوصول الى موقعك للاستمرار",
                    toastType: ToastType.error,
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: "الاعدادات",
              width: context.width / 2,
              onPressed: () async {
                await LocationHelper.goToAppSettings();
              },
            ),
            const SizedBox(height: 10),
            Text(
              "اذا قمت بتفعيل السماح بالوصول الى موقعك من الاعدادت اضغط على تفعيل الان",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    ),
  );
}
