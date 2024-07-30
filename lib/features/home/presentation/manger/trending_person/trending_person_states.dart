import 'package:lomaTV/features/home/data/models/person_model.dart';

abstract class TrendingPersonState {}

class InitialTrendingPersonState extends TrendingPersonState {}

class LoadingTrendingPersonState extends TrendingPersonState {}

class SuccessTrendingPersonState extends TrendingPersonState {
  final List<PersonModel> persons;
  SuccessTrendingPersonState(this.persons);
}

class FailureTrendingPersonState extends TrendingPersonState {
  final String error;
  FailureTrendingPersonState(this.error);
}
