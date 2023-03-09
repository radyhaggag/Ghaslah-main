import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/app_strings.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/core/widgets/custom_button.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final nameController = TextEditingController();
  final modelController = TextEditingController();
  final colorController = TextEditingController();
  final carNumberController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    modelController.dispose();
    colorController.dispose();
    carNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addCar),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'اسم السيارة'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: modelController,
                decoration: const InputDecoration(labelText: 'موديل السيارة'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: carNumberController,
                decoration:
                    const InputDecoration(labelText: 'رقم لوحة السيارة'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: colorController,
                decoration: const InputDecoration(labelText: 'لون السيارة'),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: AppStrings.addCar,
                width: context.width,
                onPressed: () {
                  // TODO : ADD CAR
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
