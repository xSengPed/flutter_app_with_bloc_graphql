import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tech_x_preparation/api/graphql_client.dart';

import '../models/company_model.dart';

part 'company_screen_event.dart';
part 'company_screen_state.dart';

class CompanyScreenBloc extends Bloc<CompanyScreenEvent, CompanyScreenState> {
  CompanyScreenBloc() : super(CompanyScreenInitial(Company())) {
    on<CompanyScreenEvent>((event, emit) async {
      log("message ${event.toString()}");
      if (event is GetCompanyDataEvent) {
        emit(CompanyScreenLoading());

        final companyData = await QlClient.getCompany();

        if (companyData != null) {
          emit(CompanyScreenLoaded(companyData));
        } else {
          emit(CompanyScreenInitial(null));
        }
      }
    });

    add(GetCompanyDataEvent());
  }
}
