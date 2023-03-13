import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/utils/extension.dart';
import 'package:ghaslah/features/booking/presentation/widgets/place_suggestion_builder.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/color_manager.dart';
import '../bloc/booking_bloc.dart';

class CustomMapSearchBar extends StatefulWidget {
  const CustomMapSearchBar({super.key});

  @override
  State<CustomMapSearchBar> createState() => _CustomMapSearchBarState();
}

class _CustomMapSearchBarState extends State<CustomMapSearchBar> {
  final FloatingSearchBarController controller = FloatingSearchBarController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: controller,
      elevation: 6,
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      hint: "ابحث عن مكان ما...",
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      height: 55,
      iconColor: AppColors.primaryColor,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: 0.0,
      openAxisAlignment: 0.0,
      width: context.width,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) => _onQueryChanged(query),
      transition: CircularFloatingSearchBarTransition(),
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              PlaceSuggestionBuilder(controller: controller),
            ],
          ),
        );
      },
    );
  }

  void _onQueryChanged(String query) {
    final sessiontoken = const Uuid().v4();
    context.read<BookingBloc>().add(
          GetMapSuggestions(input: query, sessiontoken: sessiontoken),
        );
  }
}
