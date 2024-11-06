// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tech_x_preparation/views/company/company_screen.dart';
import 'package:tech_x_preparation/views/counter/counter_view.dart';
import 'package:tech_x_preparation/views/main_screen/main_screen.dart';
import 'package:tech_x_preparation/views/spaceships/spaceships_view.dart';

const String ROUTE_MAIN_SCREEN = '/';
const String ROUTE_COUNTER_SCREEN = '/counter_screen';
const String ROUTE_COMPANY_SCREEN = '/company_screen';
const String ROUTE_SPACESHIP_SCREEN = '/spaceship_screen';

Map<String, Widget Function(BuildContext)> appRouter = {
  ROUTE_MAIN_SCREEN: (context) => const MainScreen(),
  ROUTE_COUNTER_SCREEN: (context) => const CounterView(),
  ROUTE_COMPANY_SCREEN: (context) => const CompanyScreen(),
  ROUTE_SPACESHIP_SCREEN: (context) => const SpaceshipView(),
};
