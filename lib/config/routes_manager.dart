import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/utils/app_strings.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/reservation/presentation/screens/add_car_screen.dart';
import '../features/reservation/presentation/screens/add_reservation_screen.dart';
import '../features/reservation/presentation/screens/location_search_screen.dart';
import '../features/reservation/presentation/screens/map_screen.dart';
import '../features/home/data/models/reservation_model.dart';
import '../features/home/data/models/service_model.dart';
import '../features/home/presentation/screens/additional_service_screen.dart';
import '../features/home/presentation/screens/reservation_details_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/profile/presentation/screens/cars_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import 'service_locator.dart';

class Routes {
  static const additionalService = "/additionalService";
  static const reservationWashRoute = "/reservationWash";
  static const homeRoute = "/home";
  static const loginScreen = "/login";
  static const registerRoute = "/register";
  static const splash = "/";
  static const addCar = "/addCar";
  static const mapScreen = "/mapScreen";
  static const locationSearch = "/locationSearch";
  static const reservationDetails = "/reservationDetails";
  static const cars = "/cars";
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
      case Routes.reservationDetails:
        return MaterialPageRoute(
          builder: (_) => ReservationDetailsScreen(
            reservationModel: settings.arguments as ReservationModel,
          ),
        );
      case Routes.reservationWashRoute:
        return MaterialPageRoute(
          builder: (_) {
            final args = settings.arguments as Map<String, dynamic>;
            final int mainServiceId = args['mainServiceId'];
            final List<int> additionalServicesId = args['additionalServicesId'];
            return ReservationWashScreen(
              mainServiceId: mainServiceId,
              additionalServices: additionalServicesId,
            );
          },
        );
      case Routes.addCar:
        return MaterialPageRoute(
          builder: (_) => const AddCarScreen(),
        );
      case Routes.cars:
        return MaterialPageRoute(
          builder: (_) => const CarsScreen(),
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
