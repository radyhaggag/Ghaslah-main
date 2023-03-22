import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../data/models/gift_model.dart';
import '../../bloc/gifts_bloc.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({super.key, this.gift});

  final GiftModel? gift;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.wallet_giftcard,
            size: 50,
            color: AppColors.primaryColor,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الهدية من \t ${gift?.senderPhoneNumber ?? "01030096242"}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  gift?.message ?? " رسالة" * 10,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black87,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  "الكمية \t ${gift?.amount ?? 50} ريال",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: AppColors.red,
            onPressed: () {
              context.read<GiftsBloc>().add(DeleteGift(gift!.id));
            },
          ),
        ],
      ),
    );
  }
}
