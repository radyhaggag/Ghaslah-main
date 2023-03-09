import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../config/routes_manager.dart';
import '../config/service_locator.dart';
import '../config/theme_manager.dart';
import '../features/booking/presentation/bloc/booking_bloc.dart';
import '../features/home/presentation/bloc/home_bloc.dart';

class GhaslahApp extends StatelessWidget {
  const GhaslahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(sl()),
        ),
        BlocProvider<BookingBloc>(
          create: (context) => BookingBloc(sl()),
        ),
      ],
      child: MaterialApp(
        theme: CustomTheme.lightTheme(),
        locale: const Locale('ar'),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar')],
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splash,
      ),
    );
  }
}
