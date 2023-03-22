import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/utils/extension.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';

import '../../../../../core/widgets/custom_error_view.dart';
import '../../bloc/home_bloc.dart';
import '../additional_service/additional_services_builder.dart';
import 'base_services_builder.dart';
import 'bottom_services_price_tile.dart';
import 'home_gradient.dart';
import 'home_welcome_message.dart';

class HomeModuleView extends StatelessWidget {
  const HomeModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        if (current is GetAllServicesLoading ||
            current is GetAllServicesSuccess ||
            current is GetAllServicesFailed) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        final homeBloc = context.read<HomeBloc>();
        if (state is GetAllServicesLoading) {
          return const CenterProgressIndicator();
        } else if (homeBloc.homeServicesModel != null) {
          return Stack(
            children: [
              const HomeGradient(),
              const HomeWelcomeMsg(),
              Container(
                margin: EdgeInsets.only(
                  top: context.height * .25,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseServicesBuilder(
                      services: homeBloc.homeServicesModel!.mainServices,
                    ),
                    const SizedBox(height: 12),
                    AdditionalServicesBuilder(
                      services: homeBloc.homeServicesModel!.additionalServices,
                    ),
                  ],
                ),
              ),
              const BottomServicesPriceTile(),
            ],
          );
        } else if (state is GetAllServicesFailed) {
          return CustomErrorView(message: state.message);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
