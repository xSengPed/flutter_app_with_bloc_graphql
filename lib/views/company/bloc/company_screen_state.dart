part of 'company_screen_bloc.dart';

@immutable
class CompanyScreenState {}

class CompanyScreenInitial extends CompanyScreenState {
  final Company? company;
  CompanyScreenInitial(this.company);
}

class CompanyScreenLoading extends CompanyScreenState {}

class CompanyScreenLoaded extends CompanyScreenState {
  final Company company;

  CompanyScreenLoaded(this.company);
}
