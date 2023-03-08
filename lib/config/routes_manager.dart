import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/utils/strings_manager.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/booking/presentation/views/book_wash_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const splashRoute = "/";
  static const homeRoute = "/home";
  static const bookingWashRoute = "/bookingWash";
  static const profileScreen = "/profile";
  static const registerRoute = "/register";
  static const loginScreen = "/login";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.bookingWashRoute:
        return MaterialPageRoute(builder: (_) => const BookingWashScreen());
      // case Routes.profileScreen:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>(
            create: (context) => AuthBloc()
              ..add(
                const ChangeCrossFadeState(0),
              ),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(),
            child: const RegisterScreen(),
          ),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
