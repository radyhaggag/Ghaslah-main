import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/config/service_locator.dart';
import 'package:ghaslah/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:ghaslah/features/home/data/models/service_model.dart';
import 'package:ghaslah/features/home/presentation/screens/additianol_service_screen.dart';
import 'package:ghaslah/features/splash/presentation/screens/splash_screen.dart';
import '../core/utils/app_strings.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/booking/presentation/views/book_wash_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const additionalService = "/additionalService";
  static const bookingWashRoute = "/bookingWash";
  static const homeRoute = "/home";
  static const loginScreen = "/login";
  static const registerRoute = "/register";
  static const splash = "/";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.additionalService:
        return MaterialPageRoute(
          builder: (_) => AdditionalServiceScreen(
            serviceModel: settings.arguments as ServiceModel,
          ),
        );
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.bookingWashRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BookingBloc>(
            create: (context) => BookingBloc(),
            child: const BookingWashScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(sl())..add(const ChangeCrossFadeState(0)),
            child: const LoginScreen(),
          ),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(sl()),
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
