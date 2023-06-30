import 'package:flutter/material.dart';

class GiftMessageInputField extends StatelessWidget {
  const GiftMessageInputField({super.key, required this.messageController});

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: messageController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value!.length < 10 || value.length > 100) {
          return "يجب ان تكون الرسالة ما بين 10 الى 100 حرف";
        }
        return null;
      },
      maxLength: 100,
      decoration: const InputDecoration(
        hintText: 'أكتب رسالة',
      ),
    );
  }
}
