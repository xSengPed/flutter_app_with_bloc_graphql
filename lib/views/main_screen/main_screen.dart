import 'package:flutter/material.dart';
import 'package:tech_x_preparation/routes/routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        title: const Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: GridView.count(crossAxisCount: 2, children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ROUTE_COMPANY_SCREEN);
            },
            child: Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.business, size: 50),
                  Text('Company Details'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ROUTE_SPACESHIP_SCREEN);
            },
            child: Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.rocket, size: 50),
                  Text('Spaceships'),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ROUTE_COUNTER_SCREEN);
            },
            child: Card(
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.rocket, size: 50),
                  Text('Counter'),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
