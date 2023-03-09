import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app/ghaslah_app.dart';
import 'bloc_observer.dart';
import 'config/app_shared.dart';
import 'config/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppShared.init();
  initServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(const GhaslahApp());
}
