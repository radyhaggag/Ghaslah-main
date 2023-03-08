import 'package:flutter/material.dart';

import '../utils/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.width,
    this.textColor,
    this.onPressed,
    this.fontSize,
    this.backgroundColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final double? fontSize;
  final VoidCallback? onPressed;
  final String text;
  final Color? textColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: textColor,
                fontSize: fontSize,
              ),
        ),
      ),
    );
  }
}
