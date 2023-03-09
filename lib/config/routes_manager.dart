import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/features/booking/presentation/screens/location_search_screen.dart';

import '../core/utils/app_strings.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/booking/presentation/screens/add_car_screen.dart';
import '../features/booking/presentation/screens/book_wash_screen.dart';
import '../features/booking/presentation/screens/map_screen.dart';
import '../features/home/data/models/service_model.dart';
import '../features/home/presentation/screens/additional_service_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'service_locator.dart';

class Routes {
  static const additionalService = "/additionalService";
  static const bookingWashRoute = "/bookingWash";
  static const homeRoute = "/home";
  static const loginScreen = "/login";
  static const registerRoute = "/register";
  static const splash = "/";
  static const addCar = "/addCar";
  static const mapScreen = "/mapScreen";
  static const locationSearch = "/locationSearch";
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
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.mapScreen:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
        );
      case Routes.locationSearch:
        return MaterialPageRoute(
          builder: (_) => const LocationSearchScreen(),
        );
      case Routes.bookingWashRoute:
        return MaterialPageRoute(
          builder: (_) => BookingWashScreen(
            serviceModel: settings.arguments as ServiceModel,
          ),
        );
      case Routes.addCar:
        return MaterialPageRoute(
          builder: (_) => const AddCarScreen(),
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
            create: (context) => AuthBloc(sl())..add(GetCities()),
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
