import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_manager.dart';
import '../bloc/gifts_bloc.dart';
import '../widgets/send_gift_module.dart';
import '../widgets/view_gifts/view_gifts_module.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({super.key});

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: const Text('الهدايا'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "ارسال هدية"),
              Tab(text: "الهدايا المستلمة"),
            ],
          ),
        ),
        body: BlocBuilder<GiftsBloc, GiftsState>(
          builder: (context, state) {
            return const TabBarView(
              children: [
                SendGiftModule(),
                ViewGiftsModule(),
              ],
            );
          },
        ),
      ),
    );
  }
}
