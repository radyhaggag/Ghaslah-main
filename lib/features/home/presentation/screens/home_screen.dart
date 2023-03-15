import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/functions/build_toast.dart';

import '../../../../config/routes_manager.dart';
import '../../../../core/utils/color_manager.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      bottomNavigationBar: const HomeBottomNavBar(),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is GetAllServicesFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            if (state.message == "'يجب تسجيل الدخولا أولا!'") {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.loginScreen,
                (route) => false,
              );
            }
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) {
            return current is HomePageModuleChanged;
          },
          builder: (context, state) {
            return context
                .read<HomeBloc>()
                .pages[context.read<HomeBloc>().selectedIndex];
          },
        ),
      ),
    );
  }
}
