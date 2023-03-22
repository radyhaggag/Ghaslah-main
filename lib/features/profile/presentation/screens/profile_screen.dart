import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/widgets/center_progress_indicator.dart';
import 'package:ghaslah/features/profile/presentation/bloc/profile_bloc.dart';

import '../widgets/balance_section.dart';
import '../widgets/my_cars_btn.dart';
import '../widgets/profile_image.dart';
import '../widgets/sign_out_btn.dart';
import '../widgets/profile_welcome.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) {
        if (current is GetProfileLoading ||
            current is GetProfileLoadingSuccess ||
            current is GetProfileLoadingFailed) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return const CenterProgressIndicator();
        } else if (state is GetProfileLoadingSuccess) {
          return Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProfileImage(),
                  const SizedBox(height: 40),
                  ProfileWelcome(profile: state.profile),
                  const SizedBox(height: 20),
                  BalanceSection(profile: state.profile),
                  const SizedBox(height: 20),
                  const MyCarsBtn(),
                  const SizedBox(height: 20),
                  const SignOutBtn(),
                ],
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
