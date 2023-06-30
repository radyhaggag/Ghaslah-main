import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../reservation/data/models/place_suggestion_model.dart';

class PlaceSuggestionCard extends StatelessWidget {
  final PlaceSuggestionModel suggestion;

  const PlaceSuggestionCard({Key? key, required this.suggestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description
        .replaceAll(suggestion.description.split(',')[0], '');
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.all(4),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor.withOpacity(.6),
              ),
              child: const Icon(
                Icons.place,
                color: AppColors.primaryColor,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${suggestion.description.split(',')[0]}\n',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  if (subTitle.length >= 2)
                    TextSpan(
                      text: subTitle.substring(2),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
