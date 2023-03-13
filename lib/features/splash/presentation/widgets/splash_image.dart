import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/extension.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image(
        width: context.width / 2,
        height: context.width / 2,
        fit: BoxFit.contain,
        image: AssetImage(AssetsManager.logoImage),
      ),
    );
  }
}
