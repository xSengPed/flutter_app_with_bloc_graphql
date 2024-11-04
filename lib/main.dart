import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_x_preparation/api/graphql_client.dart';
import 'package:tech_x_preparation/views/company/bloc/company_screen_bloc.dart';
import 'package:tech_x_preparation/views/main_screen/main_screen.dart';
import 'package:tech_x_preparation/views/spaceships/bloc/spaceship_bloc.dart';

void main() {
  QlClient.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CompanyScreenBloc(),
          ),
          BlocProvider(
            create: (context) => SpaceshipBloc(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MainScreen(),
        ));
  }
}
