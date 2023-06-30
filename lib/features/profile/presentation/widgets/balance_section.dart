import 'package:flutter/material.dart';

import '../../data/models/profile_model.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key, required this.profile});

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.15),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'رصيدك',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(),
              ),
              const Spacer(),
              Text(
                '${profile.balance.balance} ريال',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Divider(
            color: Colors.black.withOpacity(.5),
            height: 30,
          ),
          Row(
            children: [
              Text(
                'نقاطك',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(),
              ),
              const Spacer(),
              Text(
                '${profile.point.points} نقطة',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
