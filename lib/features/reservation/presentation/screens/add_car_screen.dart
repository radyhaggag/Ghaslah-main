import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/center_progress_indicator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/car_model.dart';
import '../bloc/reservation_bloc.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final lettersController = TextEditingController();
  final modelController = TextEditingController();
  final colorController = TextEditingController();
  final carNumberController = TextEditingController();
  @override
  void dispose() {
    lettersController.dispose();
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
              Text(
                'أدخل البيانات التالية لأضافة سيارتك',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: lettersController,
                decoration:
                    const InputDecoration(labelText: 'احرف لوحة السيارة'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: carNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'رقم لوحة السيارة',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: modelController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'موديل السيارة'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: colorController,
                decoration: const InputDecoration(labelText: 'لون السيارة'),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ReservationBloc, ReservationState>(
                builder: (context, state) {
                  if (state is AddNewCarLoading) {
                    return const CenterProgressIndicator();
                  }
                  return CustomButton(
                    text: AppStrings.addCar,
                    width: context.width,
                    onPressed: () {
                      final carModel = CarModel(
                          color: colorController.text,
                          id: 1, // ANT VALUE WILL NOT SEND,
                          model: modelController.text,
                          plate: CarPlate(
                            letter: lettersController.text,
                            number: int.tryParse(carNumberController.text),
                          ));
                      context.read<ReservationBloc>().add(AddNewCar(carModel));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
