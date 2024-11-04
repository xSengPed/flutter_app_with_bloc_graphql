import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/company_screen_bloc.dart';

class CompanyScreen extends StatelessWidget {
  const CompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CompanyScreenBloc bloc = BlocProvider.of<CompanyScreenBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<CompanyScreenBloc, CompanyScreenState>(
                    builder: (context, state) {
                      // Begin Loading
                      if (state is CompanyScreenLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      // Complete
                      if (state is CompanyScreenLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Company Name : ${state.company.name}'),
                            Text('CEO : ${state.company.ceo}'),
                            Text('COO : ${state.company.coo}'),
                            Text('Employee Count : ${state.company.employees}'),
                          ],
                        );
                      }
                      // Error
                      return const Text('Error Company Screen');
                    },
                    bloc: bloc),
              )
            ],
          ),
        ),
      ),
    );
  }
}
