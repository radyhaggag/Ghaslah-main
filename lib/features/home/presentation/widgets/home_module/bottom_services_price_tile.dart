import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/utils/color_manager.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/core/widgets/custom_button.dart';

import '../../../../../config/routes_manager.dart';
import '../../bloc/home_bloc.dart';

class BottomServicesPriceTile extends StatelessWidget {
  const BottomServicesPriceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      child: Container(
        width: context.width,
        padding: const EdgeInsets.only(right: 15),
        decoration: const BoxDecoration(
          color: AppColors.secondTextColor,
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            int? mainServiceId =
                context.read<HomeBloc>().mainServiceSelected?.id;
            List<int> additionalServicesId = context
                .read<HomeBloc>()
                .additionalServiceSelected
                .map((e) => e.id)
                .toList();

            double totalPrice = context.read<HomeBloc>().totalPrice;

            bool isEnabled = mainServiceId != null;

            return Row(
              children: [
                Text(
                  "الاجمالى \t\t\t $totalPrice",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                CustomButton(
                  text: 'التالى',
                  backgroundColor: AppColors.primaryColor,
                  width: context.width / 4,
                  borderRadius: 0.0,
                  onPressed: isEnabled
                      ? () {
                          final Map<String, dynamic> args = {
                            "mainServiceId": mainServiceId,
                            "additionalServicesId": additionalServicesId,
                          };

                          Navigator.of(context).pushNamed(
                            Routes.reservationWashRoute,
                            arguments: args,
                          );
                        }
                      : null,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
