import 'package:flutter/material.dart';

class GiftAmountInputField extends StatelessWidget {
  const GiftAmountInputField({super.key, required this.amountController});

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: amountController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: const InputDecoration(
          hintText: 'الكمية',
        ),
      ),
    );
  }
}
