import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_x_preparation/views/spaceships/bloc/spaceship_bloc.dart';
import 'package:tech_x_preparation/views/spaceships/widgets/details_tile.dart';

class SpaceshipView extends StatefulWidget {
  const SpaceshipView({super.key});

  @override
  State<SpaceshipView> createState() => _SpaceshipViewState();
}

class _SpaceshipViewState extends State<SpaceshipView> {
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    SpaceshipBloc bloc = BlocProvider.of<SpaceshipBloc>(context);

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigoAccent,
        title: const Text('Spaceship Screen'),
      ),
      body: Column(
        children: [
          BlocBuilder<SpaceshipBloc, SpaceshipState>(
              builder: (context, state) {
                if (state is SpaceshipLoading) {
                  return const Flexible(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state is SpaceshipLoaded) {
                  return Flexible(
                    child: ListView.builder(
                      itemCount: state.spaceships.length,
                      itemBuilder: (context, index) {
                        return DetailTile(
                          title: state.spaceships[index].name ?? "N/A",
                          subTitle: "Type : ${state.spaceships[index].type}",
                        );
                      },
                    ),
                  );
                }

                return Container();
              },
              bloc: bloc),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        log("${bloc.state}");

                        if (bloc.state is SpaceshipLoading) {
                          return;
                        }

                        if (pageIndex > 1) {
                          bloc.add(OnBack());
                          setState(() {
                            pageIndex--;
                          });
                        }
                        return;
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Text("Page $pageIndex",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  IconButton(
                      onPressed: () {
                        if (bloc.state is SpaceshipLoading) {
                          return;
                        }
                        bloc.add(OnForward());
                        setState(() {
                          pageIndex++;
                        });
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
