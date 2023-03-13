import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/features/booking/presentation/widgets/place_suggestion_card.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import '../bloc/booking_bloc.dart';

class PlaceSuggestionBuilder extends StatelessWidget {
  const PlaceSuggestionBuilder({super.key, required this.controller});

  final FloatingSearchBarController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is GetMapSuggestionsSuccess && state.suggestions.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _getPlaceDetails(
                    context: context,
                    placeId: state.suggestions[index].placeId,
                  );
                  if (context.mounted) {
                    context.read<BookingBloc>().add(
                          ChangeBookingLocation(
                            location: state.suggestions[index].description,
                          ),
                        );
                  }
                  controller.close();
                },
                child: PlaceSuggestionCard(
                  suggestion: state.suggestions[index],
                ),
              );
            },
            itemCount: state.suggestions.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  void _getPlaceDetails({
    required BuildContext context,
    required String placeId,
  }) {
    final sessiontoken = const Uuid().v4();
    context.read<BookingBloc>().add(
          GetPlaceDetailsByPlaceId(
            placeId: placeId,
            sessiontoken: sessiontoken,
          ),
        );
  }
}
