
import 'package:lomaTV/features/home/data/models/person_model.dart';

abstract class CastState {}

class InitialCastState extends CastState {}

class LoadingCastState extends CastState {}

class SuccessCastState extends CastState {
  final List<PersonModel> person;
  SuccessCastState(this.person);
}

class FailureCastState extends CastState {
  final String error;
  FailureCastState(this.error);
}
