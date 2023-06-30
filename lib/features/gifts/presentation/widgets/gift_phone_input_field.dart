import 'package:flutter/material.dart';

class GiftPhoneInputField extends StatelessWidget {
  const GiftPhoneInputField({super.key, required this.phoneController});

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: const InputDecoration(
          hintText: 'رقم الهاتف',
        ),
      ),
    );
  }
}
