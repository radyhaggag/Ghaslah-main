import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/widgets/center_progress_indicator.dart';
import '../../../../../core/utils/color_manager.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../bloc/home_bloc.dart';
import 'additional_services_builder.dart';
import 'base_services_builder.dart';
import 'home_gradient.dart';
import 'home_welcome_message.dart';

class HomeModuleView extends StatelessWidget {
  const HomeModuleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final homeBloc = context.read<HomeBloc>();
        if (state is GetAllServicesLoading) {
          return const CenterProgressIndicator();
        } else if (homeBloc.homeServicesModel != null) {
          return Stack(
            children: [
              const HomeGradient(),
              const HomeWelcomeMsg(),
              Padding(
                padding: const EdgeInsets.only(top: 200, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseServicesBuilder(
                      services: homeBloc.homeServicesModel!.mainServices,
                    ),
                    if (homeBloc
                        .homeServicesModel!.additionalServices.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        AppStrings.chooseExtendService,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      AdditionalServicesBuilder(
                        services:
                            homeBloc.homeServicesModel!.additionalServices,
                      ),
                    ]
                  ],
                ),
              ),
            ],
          );
        } else if (state is GetAllServicesFailed) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.whiteColor,
                      ),
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
