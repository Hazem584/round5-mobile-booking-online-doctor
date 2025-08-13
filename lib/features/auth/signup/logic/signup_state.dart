import '../data/model/signup_model.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final SignupResponse response;
  SignupSuccess(this.response);
}

class SignupError extends SignupState {
  final String error;
  SignupError(this.error);
}
