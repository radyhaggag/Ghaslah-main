import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';

class AdditionalServiceImage extends StatelessWidget {
  const AdditionalServiceImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: CircleAvatar(
            backgroundColor: AppColors.greyColor,
            foregroundColor: AppColors.primaryColor,
            child: CloseButton(),
          ),
        ),
      ],
    );
  }
}
