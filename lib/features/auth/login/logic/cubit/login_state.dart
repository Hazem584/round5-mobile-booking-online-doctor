import '../../data/model/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
