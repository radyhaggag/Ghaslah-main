import 'package:flutter/material.dart';
import 'package:ghaslah/features/profile/data/models/profile_model.dart';

class ProfileWelcome extends StatelessWidget {
  const ProfileWelcome({super.key, required this.profile});

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'مرحبا  ${profile.name}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          profile.phoneNumber,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.black54),
        ),
      ],
    );
  }
}
