import 'package:flutter/material.dart';

class SendGiftMessage extends StatelessWidget {
  const SendGiftMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'ارسال هدية لمستخدم اخر تحمل رساله له',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
