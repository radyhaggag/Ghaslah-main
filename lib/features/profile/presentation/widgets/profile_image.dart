import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';

import '../../../../../core/utils/assets_manager.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
        AssetsManager.logoImage,
        width: context.width / 2,
        height: context.width / 2,
        fit: BoxFit.cover,
      ),
    );
  }
}
