import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/widgets/center_progress_indicator.dart';
import 'package:ghaslah/features/gifts/presentation/widgets/view_gifts/gift_card.dart';

import '../../bloc/gifts_bloc.dart';

class ViewGiftsModule extends StatefulWidget {
  const ViewGiftsModule({super.key});

  @override
  State<ViewGiftsModule> createState() => _ViewGiftsModuleState();
}

class _ViewGiftsModuleState extends State<ViewGiftsModule> {
  @override
  void initState() {
    super.initState();

    context.read<GiftsBloc>().add(GetAllGifts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GiftsBloc, GiftsState>(
      builder: (context, state) {
        if (state is GetAllGiftsLoading) {
          return const CenterProgressIndicator();
        } else if (state is GetAllGiftsLoadingSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: List.generate(
                state.gifts.length,
                (index) => GiftCard(
                  gift: state.gifts[index],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
