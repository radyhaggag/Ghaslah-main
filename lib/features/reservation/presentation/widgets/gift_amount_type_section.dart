import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/reservation_bloc.dart';

class GiftAmountTypeSection extends StatelessWidget {
  const GiftAmountTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'طريقة الدفع لارسال الهديه',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'رصيد',
                    groupValue:
                        context.read<ReservationBloc>().bookModel.paymentMethod,
                    onChanged: (value) {
                      if (value == null) return;
                      context.read<ReservationBloc>().add(ChangePaidWay(value));
                    },
                    title: const Text('رصيد'),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'نقاط',
                    groupValue:
                        context.read<ReservationBloc>().bookModel.paymentMethod,
                    onChanged: (value) {
                      if (value == null) return;
                      context.read<ReservationBloc>().add(ChangePaidWay(value));
                    },
                    title: const Text('نقاط'),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
