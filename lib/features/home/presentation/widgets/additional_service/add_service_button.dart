import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/core/widgets/custom_button.dart';

import '../../../../../core/utils/color_manager.dart';

class AddServiceButton extends StatelessWidget {
  const AddServiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: "اضافة الخدمة",
      width: context.width,
      onPressed: () {},
      textColor: AppColors.whiteColor,
      fontSize: 20,
    );
  }
}

// Positioned(
//       top: MediaQuery.of(context).size.height * 0.28,
//       right: 30.0,
//       child: Container(
//         width: 70.0,
//         height: 70.0,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: AppColors.primaryColor,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 5,
//               spreadRadius: 1,
//               offset: const Offset(1, 1),
//             ),
//           ],
//         ),
//         child: const Icon(
//           FontAwesomeIcons.plus,
//           size: 25.0,
//           color: Colors.white,
//         ),
//       ),
//     );
  