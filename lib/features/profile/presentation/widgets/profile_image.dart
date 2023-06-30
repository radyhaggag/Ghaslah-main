import 'package:flutter/material.dart';
import 'package:ghaslah/core/utils/extension.dart';

import '../../../../../core/utils/assets_manager.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        AssetsManager.logoImage,
        width: context.width / 2.5,
        height: context.width / 2.5,
        fit: BoxFit.cover,
      ),
    );
  }
}
