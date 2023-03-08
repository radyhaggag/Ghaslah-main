import 'package:flutter/material.dart';

import '../../../../core/utils/color_manager.dart';

class GiftsScreen extends StatelessWidget {
  const GiftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Gifts'),
      ),
    );
  }
}
