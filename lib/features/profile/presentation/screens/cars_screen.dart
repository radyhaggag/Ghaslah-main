import 'package:flutter/material.dart';

import '../widgets/cars_screen_body.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("سياراتى"),
      ),
      body: const CarsScreenBody(),
    );
  }
}
