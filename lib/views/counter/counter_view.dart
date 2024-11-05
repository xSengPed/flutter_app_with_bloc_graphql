import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Counter Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterInitial) {
                    return Center(
                        child: Text(
                      "${state.value}",
                      style: const TextStyle(fontSize: 24),
                    ));
                  }
                  if (state is CounterCurrent) {
                    return Center(
                        child: Text(
                      "${state.value}",
                      style: const TextStyle(fontSize: 24),
                    ));
                  } else {
                    return const Text("Error Counter Screen");
                  }
                },
                bloc: bloc),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisSpacing: 8,
              crossAxisCount: 3,
              children: [
                ElevatedButton(
                    onPressed: () {
                      bloc.add(OnIncrement());
                    },
                    child: const Icon(Icons.plus_one_outlined)),
                ElevatedButton(
                    onPressed: () {
                      bloc.add(OnReset());
                    },
                    child: const Icon(Icons.settings_backup_restore)),
                ElevatedButton(
                    onPressed: () {
                      bloc.add(OnDecrement());
                    },
                    child: const Icon(Icons.exposure_minus_1)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
