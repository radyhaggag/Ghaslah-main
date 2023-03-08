import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ghaslah/app/ghaslah_app.dart';
import 'package:ghaslah/config/service_locator.dart';

import 'bloc_observer.dart';

void main() {
  initServiceLocator();
  Bloc.observer = MyBlocObserver();

  runApp(const GhaslahApp());
}
