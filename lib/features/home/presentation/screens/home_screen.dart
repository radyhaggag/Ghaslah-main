import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/features/home/presentation/widgets/home_bottom_nav_bar.dart';

import '../../../../core/utils/color_manager.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return current is HomePageModuleChanged;
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.greyColor,
          bottomNavigationBar: const HomeBottomNavBar(),
          body: context
              .read<HomeBloc>()
              .pages[context.read<HomeBloc>().selectedIndex],
        );
      },
    );
  }
}
